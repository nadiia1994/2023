# resource "aws_s3_bucket" "terraform_backend" {
#   bucket = "hello-kaizen111"
#   acl    = "private"

#   versioning {
#     enabled = true
#   }

#   tags = {
#     Name        = "My bucket"
#   }
# }

# resource "time_sleep" "wait150sec" {
#     depends_on = [ aws_s3_bucket.terraform_backend ]
#     create_duration = "150s"
# }

# terraform {
#     backend "s3" {
#     bucket = "hello-kaizen111"
#     key    = "ohio/terraform.tfstate"
#      region = "us-east-2"
#     # dynamodb_table = "lock-state"
#   } 
#   }
