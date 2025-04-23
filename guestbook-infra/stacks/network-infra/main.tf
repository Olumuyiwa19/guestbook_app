module "network" {
  source = "../../modules/network"

  app_name       = var.app_name
  environment    = var.environment
  region         = var.region
  shared_profile = var.shared_profile

  cidr_quad_zero       = var.cidr_quad_zero
  main_vpc_cidr        = var.main_vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs

}
