provider "aws"{
  region     = "us-west-2"
  access_key = var.access_key
  secret_key = var.secret_key
}

variable "access_key"{
  type = string
  default = "AKIA5ZBYJCJ5JCBMEWE6"   
}

variable "secret_key"{
  type = string
}

resource "aws_iam_user" "lb" {
  name = "demo_user.${count.index}"
  path = "/system/"
  count = 3
}

output "arns"{
  value = aws_iam_user.lb[*].arn
}

output "names"{
  value = aws_iam_user.lb[*].name
}

output "zipmap"{
  value = zipmap(aws_iam_user.lb[*].name, aws_iam_user.lb[*].arn)
}

