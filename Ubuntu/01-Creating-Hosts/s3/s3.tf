resource "aws_s3_bucket" "openstackbucket" {
  bucket = var.bucket_name 
  acl = "private"

  versioning {
    enabled = true
  }

  tags = {
      Name = "OpenStack_Bucket"
  }
}