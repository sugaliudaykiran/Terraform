# "for_each" makes use of "map/set" as a index value of the created resources.

provider "aws" {
  region     = "us-west-2"
  access_key = "AKIA5ZBYJCJ5JCBMEWE6"
  secret_key = ""
}

# To avoid the using of count and it's draw-back's

resource "aws_iam_user" "lb" {
  for_each = to_set(["user_01", "user_02", "user_03", "user_04", "user_0"])
  name     = each.key
  path     = "/system/"
}

# In above case "Resource Address was directly mapped with the resource name."

# "for_each" in case of map :-

resource "aws_instance" "myec2" {
  ami = "ami-0cea098ed2ac54925"
  for_each = {
    key1 = "t2.micro"
    key2 = "t2.small"
  }
  instance_type = each.value
  key_name      = each.key

  tags = {
    name = each.value
  }
}
