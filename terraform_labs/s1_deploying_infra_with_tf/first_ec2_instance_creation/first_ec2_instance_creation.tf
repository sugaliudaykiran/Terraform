# Configure the AWS Provider
provider "aws"{
    region = "us-east-2"
    access_key = "AKIA5ZBYJCJ5E4N6YLHN"
    secret_key = "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"
}

# Configure the resource details
resource "aws_instance" "myec2" {
    ami = "ami-0cc87e5027adcdca8"
    instance_type = "t2.micro"
}
