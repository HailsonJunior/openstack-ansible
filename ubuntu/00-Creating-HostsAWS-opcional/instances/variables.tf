variable "ami" {
  type        = string
  description = "AMI"
  default     = "ami-0fb653ca2d3203ac1"
}

variable "block_size" {
  type        = number
  description = "Storage block size"
  default     = 20
}

variable "block_size_sdd" {
  type        = number
  description = "EBS size sdd"
  default     = 30
}

variable "block_size_sde" {
  type        = number
  description = "EBS size sde"
  default     = 30
}
