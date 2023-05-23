# terraform graph > graph.dot
# coverting graph.dot --> graph.svg
# cat graph.dot | dot -Tsvg > graph.svg

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.60.0"
    }
  }
}

provider "aws" {
  access_key = "${var.access_key_value}"
  secret_key = var.secret_key_value
  region = "us-west-2"
}

variable "access_key_value"{
   type = string
   default = "AKIA5ZBYJCJ5JCBMEWE6"
}

variable "secret_key_value"{
   type = string
}

resource "aws_instance" "myec2" {
  ami           = "ami-082b5a644766e0e6f" # us-west-2
  instance_type = "t2.micro"
}

resource "aws_eip" "lb" {
  instance = aws_instance.myec2.id
  vpc      = true
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["${aws_eip.lb.private_ip}/32"]

  }
}

