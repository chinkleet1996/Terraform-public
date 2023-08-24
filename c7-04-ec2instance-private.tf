# AWS EC2 Instance Terraform Module
# EC2 Instances that will be created in VPC Private Subnets

locals {

  num_suffix_format = "-%d"
  multiple_instances = {
    0 = {
      num_suffix    = 1
      instance_type = "t2.micro"
      subnet_id     = element(module.vpc.private_subnets, 0)
    }
    1 = {
      num_suffix    = 2
      instance_type = "t2.micro"
      subnet_id     = element(module.vpc.private_subnets, 1)
    }
  }
}

module "ec2_private" {
  depends_on = [ module.vpc ] # VERY VERY IMPORTANT else userdata webserver provisioning will fail
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.3.1"
  # insert the 10 required variables here
  for_each = local.multiple_instances
  name                   = format("%s${local.num_suffix_format}", local.name, each.value.num_suffix)
  ami                    = data.aws_ami.amzlinux2.id
  instance_type          = each.value.instance_type
  subnet_id              = each.value.subnet_id
  key_name               = var.instance_keypair
  #monitoring             = true
  vpc_security_group_ids = [module.private_sg.security_group_id]
  #subnet_id              = module.vpc.public_subnets[0]  
  user_data = file("${path.module}/app1-install.sh")
  tags = local.common_tags
}


