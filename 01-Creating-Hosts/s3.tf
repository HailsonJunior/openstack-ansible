resource "aws_s3_bucket" "OpenStack_Bucket" {
  bucket = "OpenStack_Bucket"
  acl = "private"

  tags = {
      Name = "OpenStack_Bucket"
      Environment = "Prod"
  }
}