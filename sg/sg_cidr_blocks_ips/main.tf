resource "aws_security_group" "my_sg" {
  name   = "${var.sg_name}-${var.env}"
  vpc_id = var.vpc_id

  ingress {
    from_port   = var.ingress_from_port
    to_port     = var.ingress_to_port
    protocol    = var.ingress_protocol
    cidr_blocks = var.ingress_cidr_blocks_list
  }

  egress {
    from_port   = var.egress_from_port
    to_port     = var.egress_to_port
    protocol    = var.egress_protocol
    cidr_blocks = var.egress_cidr_blocks_list
  }

  tags = {
    Name = "${var.sg_name}-${var.env}"
  }
}