Based on everything we've discussed over the last few weeks, you're aiming to become a **Platform/DevOps Engineer**, not just someone who knows Terraform commands. So instead of only learning Terraform syntax, you should learn **how Terraform is used in production**.

Below is the roadmap I would follow if I were preparing for interviews at companies like Atlassian, Microsoft, Amazon, Uber, or any large SaaS company.

---

# Level 1 - Terraform Fundamentals

These are the basics you should know thoroughly.

## Core Concepts

* What is Infrastructure as Code (IaC)?
* Terraform Architecture
* Providers
* Resources
* Data Sources
* Variables
* Outputs
* Locals
* Expressions
* Functions
* Dynamic Blocks
* Meta Arguments

  * `count`
  * `for_each`
  * `depends_on`
  * `lifecycle`
  * `provider`

---

# Terraform Files

Know the purpose of each.

```text
main.tf

variables.tf

outputs.tf

locals.tf

provider.tf

versions.tf

terraform.tfvars

backend.tf
```

---

# Terraform Commands

Know when and why to use them.

```text
terraform init

terraform fmt

terraform validate

terraform plan

terraform apply

terraform destroy

terraform output

terraform show

terraform state

terraform import

terraform taint (legacy)

terraform untaint (legacy)

terraform refresh

terraform workspace
```

Also understand flags like:

* `-var`
* `-var-file`
* `-target`
* `-replace`
* `-auto-approve`
* `-out`

---

# Level 2 - Project Structure

You already mentioned this.

Learn how to organize projects like:

```text
terraform/

modules/
    vpc/
    eks/
    rds/
    iam/

environments/
    dev/
    stage/
    prod/

backend/

scripts/
```

Understand why modules exist.

---

# Variables

You already know variables.

Go deeper:

* Variable Validation
* Sensitive Variables
* Complex Types
* Object Variables
* List Variables
* Map Variables
* Default Values

Example

```text
string

number

bool

list

set

map

object

tuple
```

---

# Outputs

Learn

* Module Outputs
* Root Outputs
* Sensitive Outputs

---

# Locals

When should you use

```text
locals
```

instead of variables?

---

# Data Sources

Many people skip this.

Example

Instead of creating an existing VPC

Read it

```text
data "aws_vpc"
```

---

# Level 3 - Modules (Very Important)

This is one of the biggest interview topics.

Learn

* Child Modules
* Root Module
* Reusable Modules
* Module Versioning
* Module Registry
* Private Modules

Know how companies structure shared modules.

---

# Level 4 - State Management (Extremely Important)

You already remembered this.

This is one of the most important production topics.

Learn

## Local State

```text
terraform.tfstate
```

---

## Remote State

S3

Azure Storage

GCS

Terraform Cloud

---

## State Locking

Using DynamoDB (for S3 backends)

Why?

To prevent two engineers from applying changes simultaneously.

---

## State Backup

---

## State Recovery

---

## State Migration

```text
terraform init -migrate-state
```

---

## State Commands

```text
terraform state list

terraform state show

terraform state mv

terraform state rm

terraform state pull

terraform state push
```

---

## Remote State Data Source

How one Terraform project can read outputs from another.

---

# Level 5 - Workspaces

Know when to use

```text
terraform workspace
```

versus separate directories.

---

# Level 6 - Backend Configuration

Learn

```text
backend "s3"

backend "azurerm"

backend "gcs"

backend "remote"
```

Understand:

* Encryption
* Versioning
* Locking
* IAM permissions

---

# Level 7 - Provisioners

Know them, but also know that they are generally discouraged.

* local-exec
* remote-exec
* file

Interviewers often ask **why they're discouraged**.

---

# Level 8 - Production Practices

This is what many candidates miss.

* Remote state
* State locking
* Least-privilege IAM
* Version pinning
* Separate state per environment
* Separate AWS accounts
* Reusable modules
* Code reviews
* CI/CD pipelines
* Manual approval for production
* Drift detection

---

# Level 9 - Terraform Testing

Many people don't know this exists.

Learn about:

* `terraform validate`
* `terraform test` (for supported module testing)
* Terratest (Go-based integration testing)
* Kitchen-Terraform (less common today)

---

# Level 10 - Linting & Security

Learn these tools:

* `terraform fmt`
* TFLint
* Checkov
* Trivy
* tfsec (still seen in existing projects)
* OPA
* Sentinel

Understand what each tool checks.

---

# Level 11 - Policy as Code

Learn:

* OPA
* Sentinel

Create policies like

```text
Only ap-south-1

No public S3

Encryption mandatory

Required tags

Approved instance types
```

---

# Level 12 - CI/CD

Terraform in GitHub Actions or Jenkins.

Understand:

```text
fmt

↓

validate

↓

lint

↓

security scan

↓

plan

↓

approval

↓

apply
```

---

# Level 13 - AWS-Specific Terraform

Know how to provision:

* VPC
* Subnets
* Route Tables
* Internet Gateway
* NAT Gateway
* Security Groups
* NACLs
* IAM
* EC2
* ALB/NLB
* Auto Scaling
* EKS
* ECS
* Lambda
* RDS
* S3
* CloudFront
* Route 53
* ACM
* SNS
* SQS
* Secrets Manager
* KMS

---

# Level 14 - Advanced Terraform Language

Learn:

* `for` expressions
* `if` expressions
* `try()`
* `can()`
* `coalesce()`
* `lookup()`
* `merge()`
* `flatten()`
* `zipmap()`
* `templatefile()`
* Dynamic blocks
* Complex nested objects

---

# Level 15 - Troubleshooting

Interviewers love these scenarios.

Know how to handle:

* State corruption
* State drift
* Merge conflicts in Terraform code
* Provider version conflicts
* Module version conflicts
* Circular dependencies
* Destroying production resources accidentally
* Importing existing AWS resources
* Partial applies
* Failed applies
* Recovering after interrupted applies

---

# Level 16 - Enterprise Terraform Architecture

Understand how large companies organize infrastructure.

```text
GitHub

↓

Pull Request

↓

GitHub Actions

↓

Terraform Validate

↓

TFLint

↓

Checkov

↓

Terraform Plan

↓

Manual Approval

↓

Terraform Apply

↓

Remote State Updated

↓

Slack / Teams Notification
```

---

# Topics you didn't mention that are important

These are the biggest gaps in your list:

* Data Sources
* Locals
* Meta Arguments (`count`, `for_each`, `depends_on`, `lifecycle`)
* Dynamic Blocks
* Functions and Expressions
* Backend Configuration
* Workspaces
* Remote State
* State Locking
* State Migration
* State Recovery
* Import Existing Resources
* Drift Detection
* Provider Versioning
* Module Versioning
* Policy as Code
* Testing
* Linting
* Security Scanning
* Provisioners (and why to avoid them)
* Dependency Graphs
* CI/CD Integration
* AWS IAM for Terraform
* Troubleshooting production failures

---

# What distinguishes a senior Terraform engineer?

A junior engineer says:

> "I know how to write Terraform."

A senior engineer asks:

* How is the state stored securely?
* How do we prevent two people from applying at the same time?
* How do we detect drift?
* How do we recover a corrupted state?
* How do we write reusable modules?
* How do we enforce company policies?
* How do we safely promote infrastructure from dev to production?
* How do we roll back if an apply fails?
* How do we keep pipelines fast and secure?
* How do we manage infrastructure across multiple AWS accounts and environments?

