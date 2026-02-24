terraform {
  required_version = "1.14.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.49.0"
    }
  }
  resource "aws_s3_bucket" "terraform_state_bucket" {
  bucket = "dev-damir-tf-bucket"

  lifecycle {
    prevent_destroy = false
  }
}
resource "aws_dynamodb_table" "terraform_state_lock" {
  name         = "Lock-Files"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
   }
 }
}



provider "aws" {
  region = var.aws-region
}
