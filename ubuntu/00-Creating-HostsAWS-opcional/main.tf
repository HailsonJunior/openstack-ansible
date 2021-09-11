terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 3.27"
        }
    }
    required_version = ">= 0.14.9"

    # Após criar o bucket s3, descomente o módulo abaixo para criar buckup do state
    # Ajuste o profile
    
    #backend "s3" {
    #    bucket = "openstackbucket"
    #    key = "instances-openstack-state/terraform.tfstate"
    #    region = "us-east-1"
    #    profile = "Terraform"  
    #}
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
