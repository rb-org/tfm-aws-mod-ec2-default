module "cw_cpu" {
  # source = "../terraform-aws-excp-cloudwatch//ec2_cpu"

  source = "github.com/rb-org/tfm-aws-mod-cloudwatch//ec2_cpu?ref=v0.0.2"

  instance_ids        = "${aws_instance.ec2.*.id}"
  instance_name       = "${aws_instance.ec2.*.tags.Name}"
  enable_cw_alarm_cpu = "${var.enable_cw_alarm_cpu}"
  enable_cw_metrics   = "${var.enable_cw_metrics}"
  instance_count      = "${var.instance_count}"
}

module "cw_disks" {
  # source = "../terraform-aws-excp-cloudwatch//ec2_disk_space"

  source = "github.com/rb-org/tfm-aws-mod-cloudwatch//ec2_disk_space?ref=v0.0.3"

  instance_ids             = "${aws_instance.ec2.*.id}"
  instance_name            = "${aws_instance.ec2.*.tags.Name}"
  instance_type            = "${var.instance_type}"
  instance_count           = "${var.instance_count}"
  ami_id                   = "${aws_instance.ec2.*.ami}"
  enable_cw_alarm_disk_win = "${var.enable_cw_alarm_disk_win}"
  enable_cw_alarm_disk_tux = "${var.enable_cw_alarm_disk_tux}"
  disk_namespace           = "${var.disk_namespace}"
  diskspace_disks          = "${var.diskspace_disks}"
  disk_comparison_operator = "${var.disk_comparison_operator}"
  disk_metric_desc         = "${var.disk_metric_desc}"
  disk_metric_name         = "${var.disk_metric_name}"
  disk_threshold           = "${var.disk_threshold}"
  disk_unit                = "${var.disk_unit}"
  path                     = "${var.path}"
  fstype                   = "${var.fstype}"
}
