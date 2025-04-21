
variable "app_name" {
  description = "Base name for resources"
  type        = string
}

variable "cidr_quad_zero" {
  description = "CIDR block for quad zero"
  type        = string
}

variable "environment" {
  description = "Environment tag (dev, stage, prod)"
  type        = string
}

variable "main_vpc_cidr" {
  description = "Main VPC CIDR block"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "List of public subnet CIDR blocks"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "List of private subnet CIDR blocks"
  type        = list(string)
}

variable "region" {
  description = "AWS region to deploy the resources"
  type        = string
}

variable "shared_profile" {
  description = "AWS shared profile name"
  type        = string
}
