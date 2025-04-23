resource "aws_security_group" "rds" {
  name        = "${var.app_name}-rds-sg"
  description = "RDS Security Group"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.rds_ingress_rules
    content {
      from_port       = ingress.value.from_port
      to_port         = ingress.value.to_port
      protocol        = ingress.value.protocol
      cidr_blocks     = ["10.0.0.0/16"]
      self            = true
      security_groups = var.ec2_security_groups
    }
  }

  dynamic "egress" {
    for_each = var.rds_egress_rules
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = ["0.0.0.0/0"]
    }
  }


  tags = local.tag
}

resource "aws_security_group" "web" {
  name        = "${var.app_name}-web-sg"
  description = "Web instance Security Group"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.web_ingress_rules
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = [var.my_ip]
    }
  }

  dynamic "egress" {
    for_each = var.web_egress_rules
    content {
      from_port       = egress.value.from_port
      to_port         = egress.value.to_port
      protocol        = egress.value.protocol
      cidr_blocks     = ["10.0.0.0/16"]
      self            = true
      security_groups = var.rds_security_groups
    }
  }


  tags = local.tag
}
