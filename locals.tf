locals {
  disk_count               = "${length(var.diskspace_disks)}"
  enable_cw_metrics        = "${var.enable_cw_metrics == "true" || var.enable_cw_metrics ? 1 : 0 }"
  enable_cw_alarm_cpu      = "${var.enable_cw_alarm_cpu == "true" || var.enable_cw_alarm_cpu ? true : false }"
  enable_cw_alarm_disk_win = "${var.enable_cw_alarm_disk_win == "true" || var.enable_cw_alarm_disk_win ? true : false }"
  enable_cw_alarm_disk_tux = "${var.enable_cw_alarm_disk_tux == "true" || var.enable_cw_alarm_disk_tux ? true : false }"
  root_volume_type         = "${var.root_volume_type != "" ? var.root_volume_type : data.aws_ami.info.root_device_type}"
  root_iops                = "${var.root_volume_type == "io1" ? var.root_iops : "0"}"
  machine_name_prefix      = "${upper(terraform.workspace)}${upper(var.app_id)}${upper(var.countrycode)}"
}
