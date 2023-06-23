terraform {
  backend "s3" {
    bucket = "saritabucket"
    key    = "params/terraform.tfvars"
    region = "us-east-1"
  }
}