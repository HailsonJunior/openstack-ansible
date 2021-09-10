variable "aws_region" {
    type = string
    description = "Região do privider AWS"
}

variable "aws_region_vpc" {
    type = string
    description = "Região da VPC criada. EX: us-east-1a"
}

variable "ami" {
    type = string
    description = "AMI da instancia"
    default = "ami-0cb5f8e033cfa84d2"  
}

variable "block_size" {
    type = number
    description = "Temanho do armazenamento"
    default = 30
}

variable "block_type" {
    type = string
    description = "Tipo do armazenamento"
    default = "gp2"
}

# variable "aws_credential" {
#   type = string
#    description = "AWS credentials"
#}

# variable "aws_profile" {
#    type = string
#    description = "AWS profile"
#}