provider "aws" {
  region = var.region  # Replace with your desired region
}

resource "aws_s3_bucket" "example" {
  bucket = var.bucket_name     #Simple bucket creation for demo purpose

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}