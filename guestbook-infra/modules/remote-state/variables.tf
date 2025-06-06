
variable "bucket_name" {
  description = "Name of the S3 bucket for Terraform state"
  type        = string
}

variable "environment" {
  description = "Environment tag (dev, stage, prod)"
  type        = string
}

variable "key_alias" {
  description = "Alias for the KMS key used to encrypt the S3 bucket"
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
