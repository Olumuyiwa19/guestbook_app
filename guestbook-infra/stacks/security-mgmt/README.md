# Security Management Stack

This stack manages AWS security resources and configurations for the Guestbook application infrastructure.

## Overview

The security management stack handles the creation and configuration of:

- Security Groups
- Network ACLs
- AWS WAF configurations
- GuardDuty setup
- Security Hub integration
- CloudWatch security alarms

## Prerequisites

- AWS credentials configured with appropriate permissions
- Terraform v1.0.0 or later
- Remote state backend configured (S3)
- Network infrastructure stack deployed

## Resource Dependencies

This stack depends on:

- Network Stack (VPC and subnet information)
- IAM Stack (for service roles)

## File Structure

```
security-mgmt/
├── main.tf           # Main security resource definitions
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

- Security Groups for:
  - Web servers
  - Database instances
  - Management access

## Security Considerations

- Defense in depth approach implemented
- Regular security assessments enabled
- Automated threat detection and response
- Compliance standards enforcement
- Security logs centralization
- Real-time alerting configured
