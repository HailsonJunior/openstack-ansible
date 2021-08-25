terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 3.27"
        }
    }
    required_version = ">= 0.14.9"
}

provider "aws" {
    region = var.aws_region
    shared_credentials_file = var.aws_credential
    profile = var.aws_profile
}

# Ajuste o profile
backend "s3" {
  bucket = "OpenStack_Bucket"
  key = "instances-openstack-state/terraform.tfstate"
  region = us-east-1
  profile = "Terraform"  
}