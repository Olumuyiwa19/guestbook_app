# Database Stack

This stack manages the RDS database infrastructure for the Guestbook application.

## Overview

The database stack handles the creation and configuration of:

- RDS instance for MySQL database
- Database subnet groups in private subnets
- Parameter groups for database configuration
- Security group rules for database access
- Backup and maintenance windows
- Encryption configuration

## Prerequisites

- AWS credentials configured with appropriate permissions
- Terraform v1.0.0 or later
- Remote state backend configured (S3)
- The following stacks must be deployed first:
  - Networking stack (for VPC and subnet information)
  - Security Management stack (for security groups)
  - Secret Management stack (for database credentials)

## Resource Dependencies

This stack depends on:

- Networking Stack (VPC and subnet IDs)
- Security Management Stack (security group IDs)
- Secret Management Stack (database credentials)

## File Structure

```

databases/
├── main.tf           # Main database resource definitions
├── variables.tf      # Input variable definitions
├── providers.tf      # AWS provider configuration
├── backends.tf       # Remote state configuration
├── locals.tf         # Local variables
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

- RDS instance with:
  - MySQL 8.0 engine
  - Instance class as specified in variables
  - Multi-AZ deployment option
  - Storage encryption using KMS
  - Automated backups enabled
  - Enhanced monitoring enabled

- DB subnet group spanning private subnets

## Security Considerations

- Database instance deployed in private subnets only
- Access restricted by security groups
- Credentials managed through AWS Secrets Manager
- Storage encryption enabled by KMS key
- Automated backups enabled
- SSL/TLS encryption for data in transit
- Enhanced monitoring enabled for performance tracking
- Regular maintenance windows configured
