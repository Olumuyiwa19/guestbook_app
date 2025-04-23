module "secrets" {
  source = "../../modules/secret-mgmt"

  app_name       = var.app_name
  environment    = var.environment
  region         = var.region
  shared_profile = var.shared_profile

  db_username  = var.db_username
  db_password  = "" # let Terraform generate one
  rds_endpoint = var.rds_endpoint
  db_port      = var.db_port
  db_name      = var.db_name
  db_engine    = var.db_engine


}
