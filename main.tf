// Elastic IP
resource "aws_eip" "eip_main" {
  count    = "${var.public_ip ? var.instance_count : 0}"
  instance = "${element(aws_instance.ec2.*.id, count.index)}"
  vpc      = true
}

// EC2 instance
resource "aws_instance" "ec2" {
  count                  = "${var.instance_count}"
  ami                    = "${var.ami_id}"
  instance_type          = "${var.instance_type}"
  subnet_id              = "${element(data.aws_subnet.subnet_info.*.id, count.index)}"
  iam_instance_profile   = "${var.instance_profile_name}"
  vpc_security_group_ids = ["${var.security_group_ids}"]
  key_name               = "${var.key_pair}"

  # use_prv_ip
  private_ip = "${var.use_prv_ip ? cidrhost(element(data.aws_subnet.subnet_info.*.cidr_block, count.index), var.private_ip) : ""}"

  availability_zone       = "${length(var.availability_zone) != 0 ? element(var.availability_zone, count.index) : element(data.aws_availability_zones.available.names, count.index)}"
  monitoring              = "${var.enable_monitoring}"
  ebs_optimized           = "${var.ebs_optimized}"
  disable_api_termination = "${var.disable_api_termination}"
  user_data               = "${element(data.template_file.ec2_userdata.*.rendered, count.index)}"

  credit_specification {
    cpu_credits = "${var.cpu_credits}"
  }

  root_block_device {
    volume_type           = "${local.root_volume_type}"
    volume_size           = "${var.root_volume_size}"
    iops                  = "${local.root_iops}"
    delete_on_termination = "${var.root_delete_on_termination}"
  }

  lifecycle {
    create_before_destroy = true
    ignore_changes        = ["user_data", "ami", "private_ip", "root_block_device", "ebs_block_device"]
  }

  tags = "${merge(var.default_tags,
    map("Name",                   "${lower(var.instance_name)}-${format("%03d", count.index+01)}"),
    map("AppID",                  "${lower(var.app_id)}"),
    map("AppRole",                "${lower(var.app_role)}"),
    map("Environment",            "${lower(terraform.workspace)}"),
    map("Backup ",                "${lower(var.backup_enabled)}"),
    map("Version",                ""),
    map("ChefEnabled",            "${lower(var.chef_enabled)}"),
    map("Patch Group",            "${lower(var.patch_group)}"),
    map("PatchingDay",            "${count.index%2 == "0" ? "${lower(var.patching_day1)}" : "${lower(var.patching_day2)}"}"),
    map("Workload",               "${lower(var.workload)}"),
    map("OS",                     "${lower(var.os)}"),
    )
  }"
}

resource "aws_ebs_volume" "ec2_volume" {
  count             = "${var.instance_count * length(var.ebs_volume)}"
  availability_zone = "${element(aws_instance.ec2.*.availability_zone, (count.index + 1) / length(var.ebs_volume))}"
  type              = "${lookup(var.ebs_volume[element(keys(var.ebs_volume), count.index)], "type", var.ebs_volume_type)}"
  size              = "${lookup(var.ebs_volume[element(keys(var.ebs_volume), count.index)], "size", var.ebs_volume_size)}"
  iops              = "${lookup(var.ebs_volume[element(keys(var.ebs_volume), count.index)], "iops", var.ebs_iops)}"
  encrypted         = "true"

  tags {
    Name = "${element(aws_instance.ec2.*.tags.Name, (count.index + 1) / length(var.ebs_volume))}-${lookup(var.ebs_volume[element(keys(var.ebs_volume), count.index)], "name", var.ebs_volume_name)}"
  }
}

resource "aws_volume_attachment" "ec2_volume_attachment" {
  count       = "${var.instance_count * length(var.ebs_volume)}"
  device_name = "${element(keys(var.ebs_volume), count.index)}"
  volume_id   = "${element(aws_ebs_volume.ec2_volume.*.id, count.index)}"
  instance_id = "${element(aws_instance.ec2.*.id, (count.index + 1) / length(var.ebs_volume))}"
}
