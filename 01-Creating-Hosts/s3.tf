resource "aws_s3_bucket" "${var.hjopenstackbucket}" {
  bucket = "hjopenstackbucket"
  acl = "private"

  tags = {
      Name = "OpenStack_Bucket"
      Environment = "Prod"
  }
}