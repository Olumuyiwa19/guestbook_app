# Guestbook Infrastructure

This repository contains the Terraform infrastructure code for the Guestbook application.

## Architecture Overview

![Two-Tier Cloud Infrastructure -Page-1 drawio](https://github.com/user-attachments/assets/d92a2657-c4d7-4ab7-865a-d84066956dfb)

This infrastructure is architected with a modular and loosely coupled design, segmenting workloads into distinct components—referred to as modules and stacks. This separation enhances flexibility, scalability, and maintainability.​

Each stack comprises a group of closely related services, managed independently with isolated state files. This isolation ensures that team members can work concurrently on different stacks without the risk of state conflicts or the need for extensive coordination.​

As the organization expands and workloads increase, it's common for different teams to assume ownership of specific infrastructure components. For instance:​

Cloud Infrastructure Team (CIT): Responsible for networking and security infrastructure.

Cloud Operations Team (COT): Manages operations such as secrets and system management.

Identity and Access Management (IAM) Team: Oversees IAM infrastructure components.​

This design facilitates clear separation of duties, enabling teams to operate autonomously while contributing to a cohesive infrastructure ecosystem. It also lays the foundation for building a self-sufficient internal developer platform, promoting efficiency and scalability.

The infrastructure consists of the following main components:

- Networking components
- Security groups for network access control
- Identity and Access Management
- Database instance
- Web server instance
- Remote State Management

## Project Structure

```
guestbook-infra/
├── modules/
│   ├── compute/         # EC2 instance configuration
│   ├── database/        # RDS instance configuration
│   ├── networking/      # VPC, subnets, and routing configuration
│   |── security-mgmt/   # Security groups configuration
|   |── secret-mgmt/     # Secret manager configuration
│   └── remote-state-mgmt/   #terraform remote state configuration
├── stacks/
│   ├── compute/         # Web instance provisioning template
│   ├── database/        # RDS instance provisioning template
│   ├── networking/      # VPC, subnets, and routing provisioning template
│   |── security-mgmt/   # Security groups provisioning template
|   |── secret-mgmt/     # Secret manager provisioning template
│   └── remote-state-mgmt/   #terraform remote state provisioning template
|
└── README.MD
```

## Modules

### Networking Module

- Defines infrastructure templates for provisioning the following;
-- VPC with public and private subnets
-- Internet and NAT gateways
- Routes and Route tables

### Access Management Module

- Defines infrastructure templates for provisioning the following;
-- Security groups for RDS and EC2 instances
-- Manages ingress/egress rules

### Security Management Module

- Defines infrastructure templates for provisioning the following;
-- Security groups for RDS and EC2 instances
-- Manages ingress/egress rules

### Secret Management Module

- Defines infrastructure templates for provisioning the following;
-- Security groups for RDS and EC2 instances
-- Manages ingress/egress rules

### Database Module

- Defines infrastructure templates for provisioning the following;
-- Database instance
-- Database subnet groups
-- Database parameters
-- Manages backup and maintenance windows

### Compute Module

- Defines infrastructure templates for provisioning the following;
-- Web server instances

### Remote State Management Module

- Deploys EC2 instances
- Handles user data scripts
- Manages instance profiles

## Stacks

### Networking Stack

- Creates VPC with public and private subnets
- Implements internet and NAT gateways
- Configures route tables

### Security Management Stack

- Defines security groups for RDS and EC2 instances
- Manages ingress/egress rules
- Handles IAM roles and policies

### Database Stack

- Provisions RDS instance
- Configures database parameters
- Manages backup and maintenance windows

### Compute Stack

- Deploys EC2 instances
- Handles user data scripts
- Manages instance profiles

### Remote State Stack

- Deploys EC2 instances
- Handles user data scripts
- Manages instance profiles

## Usage

See details about the usage in the README.md file on each Stack

## Security Considerations

- All resources are deployed within a VPC
- Security groups implement least privilege access
- Nat Gateway provisioned for private subnet resources to make outbound connection
- Database instances are in private subnets
- Data stored in database are encrypted by KMS key
- Database credentials stored and retrieved on runtime from secret manager

## Future Work

- Move Web instance to private subnet
- Create Load Balancer Module and Provision Load Balancer in public subnet and add web instance in the target group, configure listerner rule
- Add WAF to Load Balancer for web access firewall
- Implement monitoring and logging
