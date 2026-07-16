# AWS Knowledge Guide for Intermediate DevOps Engineer

**Target Audience**: DevOps Engineers with 2–5 years of experience  
**Focus**: Practical, job-ready AWS knowledge for automation, deployments, and production environments

---

## 1. Foundation Services (Must be Strong)

- **IAM** (Identity and Access Management)
  - Users, Groups, Roles, Policies
  - Least Privilege Principle
  - Cross-account access & IAM Identity Center
  - Policy evaluation logic

- **VPC** (Virtual Private Cloud)
  - Subnets (Public & Private)
  - Route Tables, Internet Gateway, NAT Gateway
  - Security Groups & Network ACLs (NACLs)
  - VPC Endpoints & VPC Peering

- **EC2**
  - Instance types & families
  - AMIs, User Data, Launch Templates
  - Auto Scaling Groups (ASG)
  - Elastic Load Balancing (ALB, NLB)

- **S3**
  - Buckets, Versioning, Lifecycle Policies
  - Encryption (SSE-S3, SSE-KMS)
  - Static website hosting
  - Bucket Policies & Access Control

---

## 2. Compute & Containerization

- **ECS** (Elastic Container Service)
  - Task Definitions, Services
  - Fargate (serverless containers)
  - Integration with Load Balancers

- **EKS** (Elastic Kubernetes Service)
  - Cluster architecture & setup
  - Managed Node Groups & Fargate profiles
  - ALB Ingress Controller
  - Add-ons and Helm charts

- **Lambda** (Serverless)
  - Function configuration
  - Layers, Cold starts
  - Integration with API Gateway & Step Functions

---

## 3. CI/CD & Infrastructure as Code (IaC)

- **AWS Developer Tools**
  - CodePipeline
  - CodeBuild
  - CodeDeploy

- **Infrastructure as Code**
  - AWS CloudFormation (Templates, Stacks, Drift Detection)
  - AWS CDK (Python / TypeScript – Recommended)
  - Terraform (Multi-cloud standard)

- **AWS Systems Manager (SSM)**
  - Parameter Store
  - Session Manager
  - Run Command & Patch Manager

---

## 4. Databases & Storage

- **RDS**
  - Multi-AZ deployments
  - Read Replicas & Backups
  - Parameter Groups

- **DynamoDB**
  - Tables, Global Secondary Indexes (GSI)
  - DynamoDB Streams
  - On-demand vs Provisioned capacity

- **ElastiCache**
  - Redis & Memcached
  - Caching strategies

---

## 5. Observability & Monitoring

- **Amazon CloudWatch**
  - Metrics, Alarms, Dashboards
  - CloudWatch Logs & Logs Insights
  - Synthetics Canaries

- **AWS X-Ray** – Distributed tracing
- **CloudTrail** – API auditing & compliance
- Integration with Prometheus + Grafana / OpenTelemetry

---

## 6. Networking, Security & Messaging

- **Route 53** – DNS, Health Checks, Routing Policies
- **CloudFront** – Content Delivery Network (CDN)
- **SNS, SQS, EventBridge** – Event-driven architecture
- **Secrets Manager** + **KMS** – Secrets & Encryption
- **Security Services** (Basic awareness)
  - AWS WAF
  - GuardDuty
  - Security Hub

---

## 7. Key Concepts & Best Practices

- AWS Well-Architected Framework (Operational Excellence, Security, Reliability, Cost Optimization)
- Deployment Strategies: Blue/Green, Canary, Rolling updates
- GitOps principles
- Cost Optimization (Savings Plans, Reserved Instances, Spot Instances)
- Security as Code & Policy as Code
- Troubleshooting techniques (CloudWatch, VPC Flow Logs, X-Ray)

---

## Recommended Learning Path (3–6 Months)

1. **Month 1–2**: Master IAM, VPC, EC2, S3 + Terraform/AWS CDK
2. **Month 3–4**: CI/CD pipelines + Container orchestration (ECS/EKS)
3. **Month 5–6**: Observability, Serverless (Lambda), Security best practices
4. Build 2–3 portfolio projects (Full CI/CD pipeline for a web app)
5. Prepare for **AWS Certified DevOps Engineer – Professional** certification

---

**Pro Tip**:  
Focus on **why** you choose one service over another (ECS vs EKS vs Lambda) and always think about automation, security, reliability, and cost.

---
