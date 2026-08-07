
provider "aws" {
  region = var.region
}


module "web_security_group" {
  source = "./security-groups"

  # Required inputs
  region          = var.region
  web_sg_name     = var.web_sg_name
  web_sg_description = var.web_sg_description
  vpc_id          = var.vpc_id
  tag_name        = var.tag_name


  sg_ingress_rules = var.sg_ingress_rules

  sg_egress_rules = var.sg_egress_rules
}
