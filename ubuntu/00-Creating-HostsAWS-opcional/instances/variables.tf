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