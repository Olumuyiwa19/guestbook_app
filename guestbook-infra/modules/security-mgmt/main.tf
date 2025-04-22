resource "aws_security_group" "rds" {
  name        = "${var.app_name}-rds-sg"
  description = "RDS Security Group"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.rds_ingress_rules
    content {
      from_port = ingress.value.from_port
      to_port   = ingress.value.to_port
      protocol  = ingress.value.protocol
    }
  }

  dynamic "egress" {
    for_each = var.rds_egress_rules
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = ["10.0.0.0/16"]
    }
  }


  tags = local.tag
}
