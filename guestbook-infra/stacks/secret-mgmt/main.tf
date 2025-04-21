module "secrets" {
  source = "../../modules/secret-mgmt"

  app_name       = var.app_name
  environment    = var.environment
  region         = var.region
  shared_profile = var.shared_profile
}
