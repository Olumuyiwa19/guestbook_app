data "aws_caller_identity" "current" {}

module "iam" {
  source = "../../modules/web-instance"

  environment           = var.environment
  region                = var.region
  shared_profile        = var.shared_profile
  app_name              = var.app_name
  instance_type         = var.instance_type
  vpc_id                = var.vpc_id
  instance_profile      = var.instance_profile
  db_security_group_id  = var.db_security_group_id
  user_data_script      = file("${path.module}/template/user-data.sh")
  subnet_id             = var.subnet_id
  ec2_security_group_id = var.ec2_security_group_id

}
