provider "aws" {
  region = "us-east-1"
}
terraform {
    backend "s3" {
        bucket = "sts-nonprod-terraform"
        key = "TerraformInit"
        region = "us-east-1"
    }
}
resource "random_id" "bucket_name" {
  byte_length = 4
  prefix = "bucket-"
}

resource "aws_s3_bucket" "bucket" {
  bucket = random_id.bucket_name.hex
  acl    = "private"
  force_destroy = true
}