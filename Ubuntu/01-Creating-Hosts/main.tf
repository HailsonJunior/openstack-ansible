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
    #    bucket = "hjopenstackbucket"
    #    key = "instances-openstack-state/terraform.tfstate"
    #    region = "us-east-1"
    #    profile = "Terraform"  
    #}
}

provider "aws" {
    region = var.aws_region
    shared_credentials_file = var.aws_credential
    profile = var.aws_profile
}

#module "security_group" {
#    source = "./security_group"
#}

module "bucket" {
    source = "./s3"
}

module "instances" {
    source = "./instances"
    instance_type = "t2.micro"
}

