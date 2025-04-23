data "aws_caller_identity" "current" {}

data "aws_ami" "web_instance" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}


resource "aws_instance" "web_instance" {
  for_each = toset(var.subnet_ids)

  ami                         = data.aws_ami.web_instance.id
  instance_type               = var.instance_type
  iam_instance_profile        = var.instance_profile
  user_data                   = var.user_data_script
  subnet_id                   = each.value
  vpc_security_group_ids      = [var.ec2_security_group_id]
  associate_public_ip_address = true

  tags = {
    Name        = "${var.app_name}-${var.environment}-web-${each.key}"
    Environment = var.environment
  }
}
