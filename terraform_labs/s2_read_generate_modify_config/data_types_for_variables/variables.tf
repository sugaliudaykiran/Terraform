variable "access_key"{
   default = "AKIA5ZBYJCJ5JCBMEWE6"
   type = string
}
variable "secret_key"{
   type = string
}
variable "av_zones"{
   default = ["us-east-1a", "us-east-1b"]
   type = list(string)
}
/*
variable "region"{
   type = string
}
*/
variable "protocol_type"{
   type = string
}

variable "types"{
   type = map(string)
   default = {
      key1 = "us-east-1"
      key2 = "us-east-1"
   }
}


/*
variable "type"{
   type = map(string)
   default = {
      key1 = vaule1
      key2 = vaule2
   }
}

# map - var.type[key1]
# list - var.list[0]
*/
