# Network Infrastructure Stack

This stack manages the core networking infrastructure for the Guestbook application in AWS.

## Overview

The network infrastructure stack handles the creation and configuration of:

- Virtual Private Cloud (VPC)
- Public and private subnets across multiple AZs
- Internet Gateway
- NAT Gateways
- Route tables and associations
- Network ACLs

## Prerequisites

- AWS credentials configured with appropriate permissions
- Terraform v1.0.0 or later
- Remote state backend configured (S3 + DynamoDB)

## File Structure

```
network-infra/
├── main.tf           # Main network resource definitions
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

- VPC with:
  - CIDR block as specified in variables
  - DNS hostnames enabled
  - DNS support enabled
  - Flow logs enabled

- Subnets:
  - Public subnets for load balancers and bastion hosts
  - Private subnets for application instances
  - Database subnets for RDS instances
  - Each subnet in different Availability Zones

- Gateways and NAT:
  - Internet Gateway for public internet access
  - NAT Gateways in public subnets
  - Route tables for public and private subnets

## Variables

| Name | Description | Type | Required |
|------|-------------|------|----------|
| `environment` | Environment name (dev/prod) | string | yes |
| `vpc_cidr` | VPC CIDR block | string | yes |
| `public_subnet_cidrs` | List of public subnet CIDRs | list(string) | yes |
| `private_subnet_cidrs` | List of private subnet CIDRs | list(string) | yes |
| `db_subnet_cidrs` | List of database subnet CIDRs | list(string) | yes |
| `region` | AWS region | string | yes |

## Outputs

| Name | Description |
|------|-------------|
| `vpc_id` | ID of the created VPC |
| `public_subnet_ids` | List of public subnet IDs |
| `private_subnet_ids` | List of private subnet IDs |
| `db_subnet_ids` | List of database subnet IDs |
| `nat_gateway_ips` | List of NAT Gateway public IPs |

## Security Considerations

- Network ACLs configured for basic network security
- Flow logs enabled for network traffic monitoring
- Private subnets isolated from direct internet access
- Secure VPC endpoints for AWS service access
- Redundant NAT Gateways for high availability

## Network Design

### Subnet Layout

- Public Subnets: Used for load balancers and bastion hosts
- Private Subnets: Application tier for EC2 instances
- Database Subnets: Isolated tier for RDS instances

### Routing

- Public subnets route to Internet Gateway
- Private subnets route through NAT Gateways
- Database subnets have no internet access
