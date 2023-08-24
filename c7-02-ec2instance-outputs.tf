# AWS EC2 Instance Terraform Outputs
# Public EC2 Instances - Bastion Host

## ec2_bastion_public_instance_ids
output "ids" {
  description = "List of IDs of the Instances"
  value =  module.ec2_public.id
}

output "ec2_bastion_public_ip" {
  description = "List Of the Public IP addresses assigned to the instances"
  value = module.ec2_public.public_ip
}
# Private EC2 Instances

## ec2_private_instance_ids
output "IDs" {
  description = "List of IDs of the Instances"
  value =  try(module.ec2_private[0].id)
}

output "ec2_private_ip" {
  description = "List Of the Private IP addresses assigned to the instances"
  value = try(module.ec2_private[0].private_ip)
}