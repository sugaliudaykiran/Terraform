# Configure the AWS Provider
provider "aws"{
    region = "us-east-2"
    access_key = ""
    secret_key = ""
}

# Configure the resource details
resource "aws_instance" "myec2" {
    ami = "ami-0cc87e5027adcdca8"
    instance_type = "t2.micro"
}
