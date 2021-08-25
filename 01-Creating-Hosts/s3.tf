resource "aws_s3_bucket" "hjopenstackbucket" {
  bucket = "hjopenstackbucket"
  acl = "private"

  versioning {
    enabled = true
  }

  tags = {
      Name = "OpenStack_Bucket"
      Environment = "Prod"
  }
}