locals {
  environment = var.environment == "prod" ? "production" : var.environment
  app_name    = "guestbook-${local.environment}"
  region      = var.region

  tag = {
    environment = var.environment
  }
}
