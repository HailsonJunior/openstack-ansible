resource "aws_s3_bucket" "openStackbucket" {
  bucket = "OpenStack_Bucket"
  acl = "private"

  tags = {
      Name = "OpenStack_Bucket"
      Environment = "Prod"
  }
}