provider "aws" {
  region     = "us-west-2"
  access_key = "AKIA5ZBYJCJ5JCBMEWE6"
  secret_key = var.secret_key
}

variable "elb_name"{
   type = list(string)
   default = ["dev-loadbalancer","prod-loadbalancer","test-loadbalancer"]
}

resource "aws_iam_user" "lb"{
   name = var.elb_name[count.index]
   count = 3
   path = "/system/"
}

/*
resource "aws_instance" "instance-1" {
   ami = "ami-082b5a644766e0e6f"
   instance_type = "t2.micro"
   count = 3
}
*/
