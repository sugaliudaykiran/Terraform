resource "aws_elb" "myelb" {
  name               = "tfLabsElb"
  availability_zones = var.av_zones
 
  listener {
    instance_port     = 80
    instance_protocol = var.protocol_type
    lb_port           = 80
    lb_protocol       = var.protocol_type
  }
 
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    interval            = 30
    target              = "${var.protocol_type}:80/"
  }
}
/*

resource "aws_security_group_rule" "elb_ingress" {
  type        = "ingress"
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.tf_labs_elb.id
}
*/
