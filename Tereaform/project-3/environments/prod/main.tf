provider "aws" {
  region = "ap-south-1"
}

module "vpc" {
  source = "../../modules/vpc"

  environment_name   = "prod"
  cidr_block         = "10.1.0.0/16"
  public_subnet_cidr = "10.1.1.0/24"
}

output "prod_vpc_id" {
  value = module.vpc.vpc_id
}
