variable "bucket_name" {
  description = "Name of the S3 bucket for terraform state"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "key_alias" {
  description = "Alias for the KMS key used to encrypt the S3 bucket"
  type        = string
}

variable "region" {
  description = "AWS region to deploy state backend"
  type        = string
  default     = "us-west-2"
}


variable "shared_profile" {
  description = "AWS shared profile name"
  type        = string
}
