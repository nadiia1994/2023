resource "aws_s3_bucket" "bucket1" {
  bucket = "hello-kaizen111"

  tags = {
    Name        = "My bucket"
  }
}

terraform {
  backend "s3" {
    depends_on = [aws_s3_bucket.bucket1]
    bucket = "hello-kaizen111"
    key    = "ohio/terraform.tfstate"
    region = "us-east-2"
    # dynamodb_table = "lock-state"
  }
}
