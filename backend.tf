terraform {
  backend "s3" {
    bucket = "tfstate-cloud-bootcamp-terraform"
    key    = "cloud-bootcamp.tfstate"
    region = "us-east-1"
  }
}