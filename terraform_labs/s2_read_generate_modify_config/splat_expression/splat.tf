terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.60.0"
    }
  }
}

provider "aws" {
  access_key = var.access_key_value
  secret_key = var.secret_key_value
  region     = "us-west-2"
}

variable "access_key_value" {
  type    = string
  default = "AKIA5ZBYJCJ5JCBMEWE6"
}

variable "secret_key_value" {
  type = string
}

resource "aws_iam_user" "lb" {
  name  = "iamuser.${count.index}"
  count = 3
  path  = "/system/"
}

output "arns_data" {
  value = aws_iam_user.lb[*].arn
}
