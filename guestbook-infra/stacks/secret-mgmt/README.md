# Secrets Management Stack

This stack manages AWS Secrets Manager resources and secure credential storage for the Guestbook application.

## Overview

The secrets management stack handles the creation and configuration of:

- AWS Secrets Manager secrets
- Encryption keys (KMS)
- Rotation schedules
- Access policies

## Prerequisites

- AWS credentials configured with appropriate permissions
- Terraform v1.0.0 or later
- Remote state backend configured (Amazon S3)
- KMS permissions for encryption

## Resource Dependencies

This stack depends on:

- IAM Stack (for permissions configuration)
- Network Stack (for VPC endpoints)

## File Structure

```
secret-mgmt/
├── main.tf           # Main secret resource definitions
├── variables.tf      # Input variable definitions
├── providers.tf      # AWS provider configuration
├── backends.tf       # Remote state configuration
├── envs/
│   ├── dev.tfvars   # Development environment values
│   └── dev-backend.tfvars # Backend config for dev
└── README.md
```

## Usage

1. Configure environment variables:

```sh
cd envs
cp dev.tfvars.example dev.tfvars
# Edit dev.tfvars with your environment values
```

2. Initialize Terraform:

```sh
terraform init -backend-config=envs/dev-backend.tfvars
```

3. Review planned changes:

```sh
terraform plan -var-file=envs/dev.tfvars
```

4. Apply the changes:

```sh
terraform apply -var-file=envs/dev.tfvars
```

## Resources Created

- Secrets Manager secrets for:
  - Database credentials
  - API keys
  - Service accounts
  - Application secrets

- KMS keys for:
  - Secret encryption
  - Automated rotation
  - Cross-region replication

- IAM policies for:
  - Secret access
  - Key management
  - Rotation permissions

## Variables

| Name | Description | Type | Required |
|------|-------------|------|----------|
| `environment` | Environment name (dev/prod) | string | yes |
| `region` | AWS region | string | yes |
| `rotation_days` | Secret rotation period | number | yes |
| `replica_regions` | Regions for secret replication | list(string) | no |

## Outputs

| Name | Description |
|------|-------------|
| `database_secret_arn` | ARN of the database credentials secret |
| `api_key_secret_arn` | ARN of the API key secret |
| `kms_key_id` | ID of the KMS key used for encryption |

## Security Considerations

- All secrets encrypted at rest using KMS
- Automatic rotation enabled for supported secret types
- Least privilege access policies
- No secret values stored in version control
