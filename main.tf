provider "aws" {
  region = "ap-south-1"  # Replace with your desired region
}

resource "aws_s3_bucket" "example" {
  bucket = "mithun-tf-aditya-bucket"       #Simple bucket creation for demo purpose

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}