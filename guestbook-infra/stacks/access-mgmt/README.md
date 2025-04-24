# Access Management Stack

This stack manages AWS Identity and Access Management (IAM) resources for the Guestbook application infrastructure.

## Overview

The access management stack handles the creation and configuration of:

- IAM roles for EC2 instances
- IAM policies for service permissions
- Instance profiles for attaching roles to EC2 instances
- IAM users and groups for application management

## Prerequisites

- AWS credentials configured with appropriate IAM permissions
- Terraform v1.0.0 or later
- Remote state backend configured (S3 + DynamoDB)
- Base networking stack deployed

## Resource Dependencies

This stack depends on:

- Remote State Management Stack (for backend configuration)

## File Structure

```
access-mgmt/
├── main.tf           # Main resource definitions
├── variables.tf      # Input variable definitions
├── providers.tf      # AWS provider configuration
├── backends.tf       # Remote state configuration
├── envs/
│   ├── dev.tfvars   # Development environment values
│   └── dev-backend.tfvars # Backend config for dev
└── README.md
```

## Usage

1. Configure the environment variables:

```sh
cd envs
cp dev.tfvars.example dev.tfvars
# Edit dev.tfvars with your environment values
```

2. Initialize Terraform:

```sh
terraform init -backend-config=envs/dev-backend.tfvars
```

3. Review the planned changes:

```sh
terraform plan -var-file=envs/dev.tfvars
```

4. Apply the changes:

```sh
terraform apply -var-file=envs/dev.tfvars
```

## Resources Created

- IAM role for EC2 instances with:
  - SSM access for instance management
  - S3 access for application artifacts
  - RDS access for database connectivity
  - CloudWatch access for logging

- Instance profiles for attaching roles to EC2 instances

- IAM policies defining:
  - Least privilege access controls
  - Resource access boundaries
  - Service-specific permissions

## Outputs

| Name | Description |
|------|-------------|
| `instance_profile_arn` | ARN of the EC2 instance profile |
| `instance_role_name` | Name of the IAM role for EC2 instances |

## Security Considerations

- All roles follow least privilege principle
- Policies are scoped to specific resources where possible
- No hardcoded credentials
- Regular rotation of access keys
- Resource tagging enforced
