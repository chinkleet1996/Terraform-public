# AWS EC2 Security Group Terraform Module
# Security Group for Private EC2 Instances
module "private_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"
  name = "private-sg"
  description = "Security group with SSH port open for everybody (IPV4 CIDR), egress connection opened for all"
  vpc_id = module.vpc.vpc_id

# Ingress Rules & CIDR Block
  ingress_cidr_blocks = [module.vpc.vpc_cidr_block]
  ingress_rules = ["ssh-tcp", "http-tcp"]

# Egress Rules & CIDR Block
  egress_rules = ["all-all"]
  tags = local.common_tags

}

