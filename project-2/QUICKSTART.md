# AWS Terraform AI Project

## Quick Start

1. **Copy variables file:**
   ```bash
   cp terraform.tfvars.example terraform.tfvars
   ```

2. **Update terraform.tfvars with your values:**
   - Set `key_pair_name` to your AWS key pair
   - Adjust region and CIDR blocks as needed

3. **Initialize Terraform:**
   ```bash
   terraform init
   ```

4. **Plan the deployment:**
   ```bash
   terraform plan
   ```

5. **Apply the configuration:**
   ```bash
   terraform apply
   ```

## Access Pattern

- **Public Instance**: Direct access via public IP on port 80/443
- **Private Instance**: Access via bastion host only (SSH through bastion)
- **Bastion Host**: SSH gateway to private instances
- **Auto Scaling Group**: Internal load balancer for application servers

## Architecture

```
Internet Gateway
       |
    Public Subnets
   /      |      \
Public  Bastion  Public EC2
Instance  Host    Instance
       |
  NAT Gateway
       |
    Private Subnets
   /      |      \
Private  Private  Auto Scaling
Instance   App    Group
           |
     Internal Load Balancer
```

## Resources Created

### VPC & Networking
- VPC with DNS support
- Internet Gateway
- NAT Gateway with EIP
- 2 Public Subnets (10.0.1.0/24, 10.0.2.0/24)
- 2 Private Subnets (10.0.10.0/24, 10.0.20.0/24)
- Route tables (Public -> IGW, Private -> NAT)
- Network ACLs

### Security
- Public SG (HTTP, HTTPS, SSH from anywhere)
- Private SG (SSH from bastion, app traffic)
- Bastion SG (SSH from anywhere)
- ALB SG (HTTP, HTTPS)

### Compute
- Public EC2 (spot, web server)
- Private EC2 (spot, app server)
- Bastion Host (spot, SSH gateway)
- Auto Scaling Group (1-4 instances, app servers)
- Internal Application Load Balancer
- 20GB EBS volume for private instance

## Cleanup

```bash
terraform destroy
```

## Cost Optimization
- All instances use spot pricing (up to 90% savings)
- Persistent spot instances with stop behavior
- Minimal instance types (t3.micro)
- GP3 volumes for better performance/cost ratio