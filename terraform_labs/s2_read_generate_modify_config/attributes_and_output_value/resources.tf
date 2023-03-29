resource "aws_eip" "my_eip" {
    vpc = true
}

resource "aws_s3_bucket" "my_s3_bucket" {
    bucket = "tflabs-attribute-demo-001"
}
