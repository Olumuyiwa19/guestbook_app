data "aws_secretsmanager_secret" "db_password" {
  name = "/${var.app_name}-${var.environment}/db-creds"
}

data "aws_secretsmanager_secret_version" "db_password" {
  secret_id = data.aws_secretsmanager_secret.db_password.id
}


module "db_instance" {
  source               = "../../modules/database"
  app_name             = var.app_name
  environment          = var.environment
  region               = var.region
  shared_profile       = var.shared_profile
  db_identifier        = "${var.app_name}-${var.environment}-db"
  db_name              = "${var.app_name}_${var.environment}_db"
  db_engine            = var.db_engine
  db_engine_version    = var.db_engine_version
  db_instance_class    = var.db_instance_class
  db_allocated_storage = var.db_allocated_storage
  db_username          = var.db_username
  db_password          = data.aws_secretsmanager_secret_version.db_password.secret_string
  db_port              = var.db_port
  key_alias            = var.key_alias
  private_subnet_ids   = var.private_subnet_ids
  security_group_id    = var.security_group_id
}
