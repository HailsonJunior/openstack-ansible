variable "ami" {
    type = string
    description = "AMI"
    default = "ami-09e67e426f25ce0d7"
}

variable "block_size" {
    type = number
    description = "Storage block size"
    default = 20
}

variable "block_type" {
    type = string
    description = "Block type"
    default = "gp2"
}

variable "subnetid" {
    type = string
    description = "Subnet id"
    default = "subnet-3a5ad31b"
}
