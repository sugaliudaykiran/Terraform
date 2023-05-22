# Default File used in Demo
provider "aws" {
  region     = "us-west-2"
  access_key = "YOUR-ACCESS-KEY"
  secret_key = "YOUR-SECRET-KEY"
}

resource "aws_instance" "myec2" {
   ami = "ami-082b5a644766e0e6f"
   instance_type = "t2.micro
}

# variables.tf

variable "instancetype" {
  default = "t2.micro"
}

# custom.tfvars

instancetype="t2.large"

# terraform.tfvars
 instancetype="t2.large"

# CLI Commands

terraform plan -var="instancetype=t2.small"
terraform plan -var-file="custom.tfvars"

Environment Variables:

# Windows Approach
setx TF_VAR_instancetype t2.large
echo %TF_VAR_instancetype%

# Linux / MAC Approach
export TF_VAR_instancetype="t2.nano"
echo $TF_VAR
