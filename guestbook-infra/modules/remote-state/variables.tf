variable "bucket_name" {
  description = "Name of the S3 bucket for Terraform state"
  type        = string
}

variable "environment" {
  description = "Environment tag (dev, stage, prod)"
  type        = string
}
