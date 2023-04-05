terraform {
  backend "s3" {
    bucket = "altsch"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}