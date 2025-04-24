# Terraform State Management Stack

This stack manages the remote state infrastructure for all Terraform stacks in the Guestbook application.

## Overview

The Terraform state management stack handles the creation and configuration of:

- S3 bucket for state storage and state locking
- IAM roles and policies for state access
- Versioning and encryption settings

## Prerequisites

- AWS credentials configured with appropriate permissions
- Terraform v1.0.0 or later
- AWS CLI installed and configured

## File Structure

```
tfstate/
├── main.tf           # Main resource definitions
├── s3.tf            # S3 bucket configuration
├── variables.tf      # Input variable definitions
├── providers.tf      # AWS provider configuration
├── backends.tf       # Backend configuration
├── locals.tf        # Local variables
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
terraform init
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

- S3 Bucket with:
  - Versioning enabled
  - KMS key for encryption
  - Access logging

- IAM Resources:
  - Bucket access policies
  - State management roles

## Security Considerations

- Bucket encryption enabled
- Access logging configured
- Versioning enabled for state files
- State locking implemented
- Used separate state files per stack
- IAM policies follow least privilege
