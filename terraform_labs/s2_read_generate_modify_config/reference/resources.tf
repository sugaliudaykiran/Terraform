resource "aws_instance" "myec2" {
    ami = "ami-016eb5d644c333ccb"
    instance_type = "t2.micro"
}

resource "aws_eip" "my_eip" {
    vpc = true
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.myec2.id
  allocation_id = aws_eip.my_eip.id
}

resource "aws_security_group" "allow_tls" {
  name        = "Tf-security-group"

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["${aws_eip.my_eip.public_ip}/32"]
    #cidr_blocks = ["52.0.0.0/8"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

