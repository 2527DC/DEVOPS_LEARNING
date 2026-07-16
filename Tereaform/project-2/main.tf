# terraform {
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "~> 5.0"
#     }
#   }
#   required_version = ">= 1.0"
# }

# provider "aws" {
#   region = var.aws_region
# }

# module "vpc" {
#   source = "./modules/vpc"

#   # Removed project_name as it is not expected by the networking module
#   # environment attribute removed as it is not expected by the vpc module
#   cidr_block   = var.vpc_cidr

#   tags = var.tags
# }

# module "networking" {
#   source = "./modules/networking"

#   project_name = var.project_name
#   environment  = var.environment

#   vpc_id              = module.vpc.vpc_id
#   internet_gateway_id = module.vpc.internet_gateway_id

#   public_subnet_cidrs  = var.public_subnet_cidrs
#   private_subnet_cidrs = var.private_subnet_cidrs
#   availability_zones   = var.availability_zones

#   tags = var.tags
# }

# module "security" {
#   source = "./modules/security"

#   project_name = var.project_name
#   environment  = var.environment

#   vpc_id = module.vpc.vpc_id

#   tags = var.tags
# }

# module "ec2" {
#   source = "./modules/ec2"

#   project_name = var.project_name
#   environment  = var.environment

#   vpc_id             = module.vpc.vpc_id
#   public_subnet_ids  = module.networking.public_subnet_ids
#   private_subnet_ids = module.networking.private_subnet_ids

#   public_security_group_id  = module.security.public_security_group_id
#   private_security_group_id = module.security.private_security_group_id
#   bastion_security_group_id = module.security.bastion_security_group_id
#   alb_security_group_id     = module.security.alb_security_group_id

#   instance_type = var.instance_type
#   key_pair_name = var.key_pair_name
#   ami_id        = var.ami_id

#   tags = var.tags
# }