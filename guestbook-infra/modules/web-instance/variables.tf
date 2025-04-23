variable "environment" {
  type = string
}

variable "region" {
  type    = string
  default = "us-east-1"
}
variable "instance_profile" {
  description = "IAM instance profile for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "Instance type for the EC2 instance"
  type        = string
}

variable "shared_profile" {
  description = "AWS shared profile name"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "app_name" {
  description = "Name of the application"
  type        = string
}

variable "db_security_group_id" {
  description = "ID of the RDS security group to allow access from EC2"
  type        = string
}

variable "ec2_security_group_id" {
  description = "ID of the ec2 security group to allow access to EC2"
  type        = string
}

variable "user_data_script" {
  description = "User data script to run on instance launch"
  type        = string
  default     = ""
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs in different Availability Zones"
}
