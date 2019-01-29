output "instance_id" {
  description = "List of IDs of instances"
  value       = ["${aws_instance.ec2.*.id}"]
}

output "subnet_id" {
  description = "List of IDs of VPC subnets of instances"
  value       = ["${aws_instance.ec2.*.subnet_id}"]
}

output "instance_name" {
  description = "List of name of instances"
  value       = ["${aws_instance.ec2.*.tags.Name}"]
}

output "instance_tags" {
  description = "List of tags of instances"
  value       = ["${aws_instance.ec2.*.tags}"]
}

output "availability_zone" {
  description = "List of availability zones of instances"
  value       = ["${aws_instance.ec2.*.availability_zone}"]
}

output "public_dns" {
  description = "List of public DNS names assigned to the instances. Only available if you've enabled DNS hostnames for your VPC"
  value       = ["${aws_instance.ec2.*.public_dns}"]
}

output "public_eip" {
  description = "List of public IP addresses assigned to the instances, if applicable"
  value       = ["${aws_eip.eip_main.*.public_ip}"]
}

output "private_ip" {
  description = "List of private IP addresses assigned to the instances"
  value       = ["${aws_instance.ec2.*.private_ip}"]
}

output "credit_specification" {
  description = "List of credit specification of instances"
  value       = ["${aws_instance.ec2.*.credit_specification}"]
}
