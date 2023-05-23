terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.60.0"
    }
  }
}

provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = "us-west-2"
}

variable "access_key" {
  type    = string
  default = "AKIA5ZBYJCJ5JCBMEWE6"
}

variable "secret_key" {
  type = string
}
