terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.66.1"
    }
  }
}

provider "aws" {
  region     = var.region
  access_key = "${var.access_key}"
  secret_key = var.secret_key
}

variable "region"{
  type = string
  default = "ap-south-1"
}

variable "ami"{
   type = map(string)
   default = {
     "us-east-1" = "ami-0323c3dd2da7fb37d"
     "us-west-2" = "ami-0d6621c01e8c2de2c"
     "ap-south-1" = "ami-0470e33cd681b2476"
   }
}

variable "access_key"{
   type = string
   default = "AKIA5ZBYJCJ5JCBMEWE6"
}

variable "secret_key"{
   type = string 
}

variable "tags"{
   type = list(string)
   default = ["firstec2", "secondec2"]
}

resource "aws_key_pair" "loginkey" {
  key_name   = "login-key"
  public_key = file("${path.module}/new.pub")
}

/*

> element(["a","b","c"], 3)
"a"
> element(["a","b","c"], 0)
"a"
> element(["a","b","c"], 5)
"c"

*/


resource "aws_instance" "example" {
  ami           = lookup(var.ami, var.region)
  instance_type = "t2.micro"
  key_name = aws_key_pair.loginkey.key_name
  count = 2

  tags = {
    Name = element(var.tags, count.index)
  }
}

locals{
  time = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
}

output "timestamp" {
   value = local.time
}
