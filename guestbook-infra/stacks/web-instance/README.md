# Web Instance Stack

This stack manages the EC2 instances and related resources for the Guestbook application's web tier.

## Overview

The web instance stack handles the creation and configuration of:

- EC2 instances for web servers
- Instance user data configuration

## Prerequisites

- AWS credentials configured with appropriate permissions
- Terraform v1.0.0 or later
- Remote state backend configured (S3)
- The following stacks must be deployed first:
  - Network Stack (for VPC and subnet information)
  - Security Stack (for security groups)
  - IAM Stack (for instance profiles)

## File Structure

```
web-instance/
├── main.tf           # Main EC2 resource definitions
├── variables.tf      # Input variable definitions
├── providers.tf      # AWS provider configuration
├── backends.tf       # Remote state configuration
├── template/
│   └── user-data.sh  # EC2 instance bootstrap script
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

- Web instance with:
  - AMI configuration
  - Instance type selection
  - User data script
  - Security group attachments to access database instance
  - IAM instance profile

## Security Considerations

- Instance Network Configuration:
  - Instances launched in public subnets
  - Access to internet via NAT Gateway only
  - Security groups limited to required ports only (80/443 for web traffic)
