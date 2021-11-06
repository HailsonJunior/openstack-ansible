terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
  required_version = ">= 0.14.9"

  #  backend "s3" {
  #      bucket = "openstackbucket"
  #      key = "instances-openstack-state/terraform.tfstate"
  #      region = "us-east-1"
  #      profile = "Terraform"  
  #  }
}

provider "aws" {
  region = var.aws_region
}

module "s3" {
  source = "./s3"
}

module "instances" {
  source = "./instances"
}
