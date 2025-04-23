variable "environment" {
  type = string
}

variable "region" {
  type = string
}


variable "instance_profile" {
  type = string
}
variable "iam_role_name" {
  type = string
}

variable "shared_profile" {
  description = "AWS shared profile name"
  type        = string
}

variable "db_secret_arn" {
  description = "ARN of the database credentials secret"
  type        = string
}
