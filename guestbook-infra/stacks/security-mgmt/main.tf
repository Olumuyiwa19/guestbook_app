

module "sg" {
  source            = "../../modules/security-mgmt"
  app_name          = var.app_name
  environment       = var.environment
  region            = var.region
  shared_profile    = var.shared_profile
  rds_ingress_rules = var.rds_ingress_rules
  rds_egress_rules  = var.rds_egress_rules
}
