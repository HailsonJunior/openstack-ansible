resource "aws_s3_bucket" "hjopenstackbucket" {
  bucket = "hjopenstackbucket"
  acl = "private"

  tags = {
      Name = "OpenStack_Bucket"
      Environment = "Prod"
  }
}