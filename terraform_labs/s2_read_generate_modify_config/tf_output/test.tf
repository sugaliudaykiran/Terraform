# 3 - ways fetching output variable..
# 1. doing terraform apply
# 2. checking the state file
# 3. using "output" at runtime

# terraform output variable_name

provider "aws" {
  region     = "us-west-2"
  access_key = "YOUR-ACCESS-KEY"
  secret_key = "YOUR-SECRET-KEY"
}

resource "aws_iam_user" "lb" {
  name  = "iamuser.${count.index}"
  path  = "/system/"
  count = 3
}


output "iam_name" {
  value = aws_iam_user.lb[*].name
}

output "iam_arns" {
  value = aws_iam_user.lb[*].arn
}

