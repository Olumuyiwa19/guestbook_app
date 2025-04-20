locals {
  abbr_environment = {
    development = "dev"
    production  = "prod"
  }[var.environment]
  #app_name    = "guestbook-${local.environment}"
  region = var.region

  tag = {
    environment = var.environment
  }
}
