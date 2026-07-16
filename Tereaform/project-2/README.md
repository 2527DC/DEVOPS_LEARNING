# Terraform AWS Project - AI-Powered Infrastructure

## Project Overview

This project demonstrates creating a comprehensive AWS infrastructure using Terraform with AI assistance. The implementation uses a modular approach to deploy a complete VPC setup with EC2 spot instances in both public and private subnets.

## Architecture Components

### VPC Module
- Virtual Private Cloud (VPC) configuration
- Internet Gateway for public access
- NAT Gateway for private subnet internet access

### Networking Module
- **Public Subnets**: For resources that need direct internet access
- **Private Subnets**: For resources that should be isolated from direct internet access
- **Route Tables**: 
  - Public route table with routes to Internet Gateway
  - Private route table with routes to NAT Gateway

### Security Module
- Security Groups with appropriate inbound/outbound rules
- Network ACLs for additional security layers
- Best practices for security group configuration

### EC2 Module
- **Spot Instances**: Cost-effective EC2 instances using spot pricing
- **Public EC2 Instance**: Accessible from the internet for public services
- **Private EC2 Instance**: Isolated for internal services and databases
- Appropriate instance types and configurations for spot market

## Key Features

- **Modular Structure**: Separate modules for VPC, networking, security, and compute
- **Cost Optimization**: Utilization of spot instances for significant cost savings
- **Security Best Practices**: Proper security group configurations and network segmentation
- **High Availability**: Multi-AZ deployment where applicable
- **Scalability**: Infrastructure designed for easy scaling and modification

## Learning Objectives

This project focuses on:
- Understanding Terraform modular architecture
- AWS VPC design and implementation
- Route table configuration and association
- Security group management and best practices
- Spot instance deployment and management
- Public vs private subnet deployment strategies

## Provider Configuration

- **Cloud Provider**: AWS
- **Infrastructure as Code**: Terraform
- **Instance Type**: Spot instances for cost optimization
- **Network Design**: Public and private subnet architecture

## Prerequisites

- AWS CLI configured with appropriate credentials
- Terraform installed
- Basic understanding of AWS services and networking concepts
- Appropriate AWS IAM permissions for VPC, EC2, and networking resources