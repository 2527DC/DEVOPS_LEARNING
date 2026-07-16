# Real-World Scenario: Secure Three-Tier Web Application (No NAT Gateway)

## The Scenario
Your company, "CloudStore Inc.", is launching a highly secure internal web application. The security team has mandated the following:
1. The web servers must be accessible from the public internet.
2. The database servers must be strictly private and impossible to reach from the public internet.
3. Because this is a low-budget internal tool, **NO NAT Gateway** is allowed (to save costs).
4. The database server will be accessed by SSHing into the Web Server first (using it as a "Bastion Host"), and then SSHing into the database from there.

## Your Task
Using Terraform, build the infrastructure for this scenario applying the module concepts we learned.

### Requirements Checklist

#### 1. The Network Foundation (The VPC)
- [ ] Create a **VPC** with the CIDR block `10.0.0.0/16`.
- [ ] Enable DNS hostnames and DNS support.

#### 2. The Public Layer (The Web Tier)
- [ ] Create an **Internet Gateway** and attach it to the VPC.
- [ ] Create a **Public Subnet** (`10.0.1.0/24`) in Availability Zone `us-east-1a`.
- [ ] Create a **Public Route Table** with a route `0.0.0.0/0` pointing to the Internet Gateway.
- [ ] Associate the Public Subnet with the Public Route Table.

#### 3. The Private Layer (The Database Tier)
- [ ] Create a **Private Subnet** (`10.0.2.0/24`) in Availability Zone `us-east-1b`.
- [ ] Create an explicit **Private Route Table** (Do NOT add an Internet Gateway route).
- [ ] Associate the Private Subnet with the Private Route Table.

#### 4. The Security Guards (Security Groups)
- [ ] **Web SG:** Create a Security Group for the Public Subnet.
  - Allow Inbound HTTP (Port 80) from `0.0.0.0/0`.
  - Allow Inbound SSH (Port 22) from your personal IP address only.
- [ ] **Database SG:** Create a Security Group for the Private Subnet.
  - Allow Inbound MySQL (Port 3306) **ONLY** from the Web SG's ID.
  - Allow Inbound SSH (Port 22) **ONLY** from the Web SG's ID.

#### 5. The Servers (EC2 Instances)
- [ ] **Web Server (Bastion):** Launch a `t2.micro` Amazon Linux 2 EC2 instance into the Public Subnet. Attach the Web SG. Ensure it gets a Public IP address.
- [ ] **Database Server:** Launch a `t2.micro` Amazon Linux 2 EC2 instance into the Private Subnet. Attach the Database SG. Ensure it does NOT get a Public IP address.

## How to Test if You Succeeded
1. Run `terraform apply`.
2. Grab the Public IP of your Web Server from the AWS Console.
3. SSH into the Web Server. **(Success!)**
4. While logged into the Web Server, try to SSH into the Database Server's Private IP. **(Success!)**
5. Try to `ping google.com` from the Database Server. **(It should FAIL! Because there is no NAT Gateway!)**
