# This file contains the environment-specific variables for the dev environment.
app_name       = "guestbook"
cidr_quad_zero = "0.0.0.0/0"
environment    = "dev"
main_vpc_cidr  = "10.0.0.0/16"
public_subnet_cidrs = [
  "10.0.1.0/24",
  "10.0.2.0/24"
]
private_subnet_cidrs = [
  "10.0.10.0/24",
  "10.0.11.0/24"
]

region         = "us-west-2"
shared_profile = "Muyi-Admin"
