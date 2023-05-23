variable "sg_ports" {
  type        = list(number)
  description = "list of ingress ports"
  default     = [8200, 8201, 8300, 9200, 9500]
}

resource "aws_security_group" "dynamic_sg" {
  name        = "dynamic_SG"
  # description = "Ingress for Vault"

  dynamic "ingress" {
    for_each = var.sg_ports   # using For each loop
    iterator = port   # Using Iterator
    content {
      description = "Ingress for Vault"
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    for_each = var.sg_ports
    content {
      description = "Ingress for Vault"
      from_port   = egress.value
      to_port     = egress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

}
