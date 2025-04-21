variable "app_name" {
  description = "Base name for resources"
  type        = string
}

variable "environment" {
  description = "Environment tag (dev, stage, prod)"
  type        = string
}

variable "region" {
  description = "AWS region to deploy the resources"
  type        = string
}

variable "shared_profile" {
  description = "AWS shared profile name"
  type        = string
}

variable "rds_ingress_rules" {
  description = "List of ingress rules for RDS SG"
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
  }))
}

variable "rds_egress_rules" {
  description = "List of egress rules for RDS SG"
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}
