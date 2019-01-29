# Terraform - AWS - Module - EC2 Default

## Build Status

[![CircleCI](https://circleci.com/gh/rb-org/tfm-aws-mod-cloudwatch/tree/master.svg?style=svg&circle-token=2b8306711620df59902b72cd444fda10ed06cbf9)](https://circleci.com/gh/rb-org/tfm-aws-mod-cloudwatch/tree/master)

tfm-aws-mod-ec2-default     master  ./tfm-docs.sh                                               default  
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| additional\_ip |  | list | `<list>` | no |
| ami\_id | The AMI ID to use for the instance. By default it is the AMI: CIS Microsoft Windows Server 2016 Benchmark 1.0.0.9 Level 1 | string | `""` | no |
| app\_id | The identifier of the application running on the instance | string | `""` | no |
| app\_role | The identifier of the application running on the instance | string | `""` | no |
| availability\_zone |  | list | `<list>` | no |
| backup\_enabled | Whether the instance get snapshot | string | `""` | no |
| chef\_enabled | Whether Chef is enabled on the instance | string | `"true"` | no |
| cpu\_alarm\_action | Alarm action description e.g. Cleanup / Increase size of disk | string | `"EC2 CPU Utilization"` | no |
| cpu\_comparison\_operator |  | string | `"GreaterThanOrEqualToThreshold"` | no |
| cpu\_credits | T2 Unlimited (unlimited) or not (standard) | string | `"standard"` | no |
| cpu\_datapoints\_to\_alarm |  | string | `"12"` | no |
| cpu\_evaluation\_periods |  | string | `"12"` | no |
| cpu\_metric\_desc | Metric description, e.g. EC2 CPU Utilization | string | `"EC2 CPU Utilization"` | no |
| cpu\_metric\_name |  | string | `"CPUUtilization"` | no |
| cpu\_namespace |  | string | `"AWS/EC2"` | no |
| cpu\_period |  | string | `"300"` | no |
| cpu\_sns\_topic\_alarm\_arn |  | string | `""` | no |
| cpu\_sns\_topic\_ok\_arn |  | string | `""` | no |
| cpu\_statistic |  | string | `"Average"` | no |
| cpu\_threshold |  | string | `"70"` | no |
| cpu\_treat\_missing\_data |  | string | `"missing"` | no |
| cpu\_unit |  | string | `""` | no |
| default\_tags | Default tags | map | `<map>` | no |
| disable\_api\_termination | Enable/disable API protection | string | `"false"` | no |
| disk\_alarm\_action | Alarm action description e.g. Cleanup / Increase size of disk | string | `"Cleanup / Increase size of disk"` | no |
| disk\_comparison\_operator |  | string | `"LessThanThreshold"` | no |
| disk\_datapoints\_to\_alarm |  | string | `"5"` | no |
| disk\_evaluation\_periods |  | string | `"5"` | no |
| disk\_metric\_desc | Metric description, e.g. Low Disk Space - System Disks | string | `"Low Disk Space"` | no |
| disk\_metric\_name |  | string | `"LogicalDisk % Free Space"` | no |
| disk\_namespace |  | string | `"CWAgent"` | no |
| disk\_period |  | string | `"60"` | no |
| disk\_sns\_topic\_alarm\_arn |  | string | `""` | no |
| disk\_sns\_topic\_ok\_arn |  | string | `""` | no |
| disk\_statistic |  | string | `"Average"` | no |
| disk\_threshold |  | string | `"25"` | no |
| disk\_treat\_missing\_data |  | string | `"missing"` | no |
| disk\_unit |  | string | `""` | no |
| diskspace\_disks |  | list | `<list>` | no |
| ebs\_iops | Amount of provisioned IOPS. This must be set with a volume_type of io1 | string | `"0"` | no |
| ebs\_optimized | Launched EC2 instance will be EBS-optimized | string | `"false"` | no |
| ebs\_volume | The EBS volumes. Should be defined as map with the device name as key ({ '/dev/xvdb' = { type = 'gp2', size = '100' } } | map | `<map>` | no |
| ebs\_volume\_del\_on\_term | Delete the volume on instance termination | string | `"false"` | no |
| ebs\_volume\_name | The EBS volume Name tag | string | `""` | no |
| ebs\_volume\_size | Size of the EBS volume in gigabytes | string | `"10"` | no |
| ebs\_volume\_type | The type of EBS volume. Can be standard, gp2 or io1 | string | `"gp2"` | no |
| enable\_cw\_alarm\_cpu |  | string | `"false"` | no |
| enable\_cw\_alarm\_disk\_tux |  | string | `"false"` | no |
| enable\_cw\_alarm\_disk\_win |  | string | `"false"` | no |
| enable\_cw\_metrics | Enable CW Alarms & metrics | string | `"false"` | no |
| enable\_monitoring | Enable/disable instance monitoring | string | `"false"` | no |
| fstype |  | string | `"ext4"` | no |
| instance\_count | The number of instances | string | `"1"` | no |
| instance\_name |  | string | `""` | no |
| instance\_profile\_name | Instance Role profile name | string | `""` | no |
| instance\_type | The type of the instance | string | `"t3.micro"` | no |
| key\_pair | Key pair to be provisioned on the instance | string | `""` | no |
| os |  | string | `"windows"` | no |
| patch\_group | Patching Group | string | `"Windows"` | no |
| patching\_day1 | Patching Day 1 | string | `"Tuesday"` | no |
| patching\_day2 | Patching Day 2 | string | `"Saturday"` | no |
| path |  | list | `<list>` | no |
| private\_ip |  | string | `"0"` | no |
| public\_ip | Assign a public ip true/false | string | `"false"` | no |
| reboot\_sns\_topic\_alarm\_arn |  | string | `""` | no |
| recover\_sns\_topic\_alarm\_arn |  | string | `""` | no |
| root\_delete\_on\_termination | Whether the root volume should be destroyed on instance termination | string | `"true"` | no |
| root\_iops | Amount of provisioned IOPS. This must be set if root_volume_type is set to `io1` | string | `"0"` | no |
| root\_volume\_size | Size of the root volume in gigabytes | string | `"10"` | no |
| root\_volume\_type | Type of root volume. Can be standard, gp2 or io1 | string | `"gp2"` | no |
| security\_group\_ids | List of Security Group IDs allowed to connect to the instance | list | `<list>` | no |
| subnet\_ids | List of VPC Subnet IDs the instance is launched in | list | `<list>` | no |
| use\_prv\_ip |  | string | `"false"` | no |
| user\_data | Instance user data. Do not pass gzip-compressed data via this argument | string | `""` | no |
| userdata\_vars | # Testing | map | `<map>` | no |
| workload | Tag to identify which application workload is being run: exol, mgmt, rctv... | string | `"test"` | no |

## Outputs

| Name | Description |
|------|-------------|
| availability\_zone | List of availability zones of instances |
| credit\_specification | List of credit specification of instances |
| instance\_id | List of IDs of instances |
| instance\_name | List of name of instances |
| instance\_tags | List of tags of instances |
| private\_ip | List of private IP addresses assigned to the instances |
| public\_dns | List of public DNS names assigned to the instances. Only available if you've enabled DNS hostnames for your VPC |
| public\_eip | List of public IP addresses assigned to the instances, if applicable |
| subnet\_id | List of IDs of VPC subnets of instances |