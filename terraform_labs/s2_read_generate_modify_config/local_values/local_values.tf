terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.66.0"
    }
  }
}

provider "aws" {
  # Configuration options
  access_key = "${var.access_key}"
  secret_key = var.secret_key
  region = "us-west-2"
}

locals {
  common_tags = {
    owner = "DevOps Teams"
    service = "backend"
  }
  
  specific_tags = {
    owner = "Admin"
  }
}



resource "aws_instance" "app-dev" {
   ami = "ami-082b5a644766e0e6f"
   instance_type = "t2.micro"
   tags = local.common_tags
}


resource "aws_instance" "db-dev" {
   ami = "ami-082b5a644766e0e6f"
   instance_type = "t2.micro"
   tags = local.common_tags
}

resource "aws_ebs_volume" "db_ebs" {
  availability_zone = "us-west-2a"
  size              = 8
  tags = local.specific_tags
}

