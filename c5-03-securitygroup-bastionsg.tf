# AWS EC2 Security Group Terraform Module
# Security Group for Public Bastion Host
module "public_bastion_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"
  name = "public-bastion-sg"
  description = "Security group with SSH port open for everybody (IPV4 CIDR), egress connection opened for all"
  vpc_id = module.vpc.vpc_id

# Ingress Rules & CIDR Block
  ingress_cidr_blocks = ["0.0.0.0"]
  ingress_rules = ["ssh-tcp"]

# Egress Rules & CIDR Block
  egress_rules = ["all-all"]
  tags = local.common_tags

}
