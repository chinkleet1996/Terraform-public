# Terraform Block
terraform {
  required_version = "~> 1.5" # this sign means any version after 1.5(including this one) is allowed to use
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.0"
    }

    null = {
      source = "hashicorp/null"
      version = "~> 3.2"
    } 
  }
}
           


# Provider Block
provider "aws" {
  region  = var.aws_region
  profile = "default"
}
/*
Note-1:  AWS Credentials Profile (profile = "default") configured on your local desktop terminal  
$HOME/.aws/credentials
*/
