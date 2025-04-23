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

variable "web_ingress_rules" {
  description = "List of ingress rules for WEB SG"
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
  }))
}

variable "web_egress_rules" {
  description = "List of egress rules for WEB SG"
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}
variable "vpc_id" {
  description = "ID of the VPC to use"
  type        = string
  default     = "null"
}


variable "rds_security_groups" {
  description = "List of security group IDs to allow access from the web instance"
  type        = list(string)
  default     = []
}

variable "ec2_security_groups" {
  description = "List of security group IDs to allow access to the RDS instance"
  type        = list(string)
  default     = []
}

variable "my_ip" {
  description = "Your IP address for testing"
  type        = string
}
