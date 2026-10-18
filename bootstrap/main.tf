terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}
provider "aws" {
  region = var.aws_region
}
resource "aws_s3_bucket" "terraform_state" {
  bucket = var.bucket_name
}
resource "aws_s3_bucket_versioning" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}
output "bucket_name" {
  value = aws_s3_bucket.terraform_state.bucket
}