provider "aws" {
  region     = "us-west-2"
  access_key = "AKIA5ZBYJCJ5JCBMEWE6"
  secret_key = var.secret_key
}

variable "secret_key"{
   type = string
}
# owners = ["self"] # In-case user created his own ami instance.

data "aws_ami" "app_ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_instance" "ami_instance-1" {
  ami           = data.aws_ami.app_ami.id
  instance_type = "t2.micro"
}

