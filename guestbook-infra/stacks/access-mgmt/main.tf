data "aws_caller_identity" "current" {}

module "iam" {
  source = "../../modules/access-mgmt"

  environment      = var.environment
  region           = var.region
  shared_profile   = var.shared_profile
  instance_profile = var.instance_profile
  iam_role_name    = var.iam_role_name
  db_secret_arn    = "arn:aws:secretsmanager:${var.region}:${data.aws_caller_identity.current.account_id}:secret:/${var.app_name}-${var.environment}/db-credentials"

}
