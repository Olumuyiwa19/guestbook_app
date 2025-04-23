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

variable "db_identifier" {
  type        = string
  description = "Identifier for the RDS instance"
}

variable "db_engine" {
  type = string
}

variable "db_engine_version" {
  type        = string
  description = "Version of the database engine"
}

variable "db_instance_class" {
  type        = string
  description = "Instance class for the RDS instance"
  default     = "db.t3.micro"
}

variable "db_allocated_storage" {
  type        = number
  description = "Allocated storage for the RDS instance in GB"
  default     = 20
}

variable "db_name" {
  type        = string
  description = "Name of the database to create"
}

variable "db_username" {
  type = string
}

variable "db_password" {
  type = string
}

variable "db_port" {
  type = number
}

variable "security_group_id" {
  description = "ID of the security group for RDS"
  type        = string
}

variable "vpc_name" {
  description = "Name of the VPC for RDS subnet group"
  type        = string
  default     = "guestbook-vpc"
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs for RDS subnet group"
  type        = list(string)
}

variable "key_alias" {
  description = "KMS key alias for RDS encryption"
  type        = string
}
