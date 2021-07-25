resource "aws_s3_bucket" "b" {
  bucket        = "my-tf-test-bucket-asdfasdfasdfasdfasdf"
  acl           = "private"
  force_destroy = true
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
