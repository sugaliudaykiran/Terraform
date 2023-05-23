terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.66.0"
    }
  }
}

provider "aws" {
  access_key = "${var.access_key}"
  secret_key = var.secret_key
  region = var.types["key1"]
  # region = "${var.region}"
}
