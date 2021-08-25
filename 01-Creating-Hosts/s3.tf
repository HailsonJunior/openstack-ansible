resource "aws_s3_bucket" "hjopenStackbucket" {
  bucket = "hjopenStackbucket"
  acl = "private"

  tags = {
      Name = "OpenStack_Bucket"
      Environment = "Prod"
  }
}