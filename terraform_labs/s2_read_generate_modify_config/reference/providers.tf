terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.65.0"
    }
  }
}
provider "aws" {
  access_key = "${var.access_key_value}"
  secret_key = var.secret_key_value
  region = "us-east-1"
}
