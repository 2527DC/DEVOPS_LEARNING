
provider "aws" {
  region = var.region
}


module "web_security_group" {
  source = "./security-groups"

  # Required inputs
  region             = var.region
  web_sg_name        = var.web_sg_name
  web_sg_description = var.web_sg_description
  vpc_id             = var.vpc_id
  tag_name           = var.tag_name


  sg_ingress_rules = var.sg_ingress_rules

  sg_egress_rules = var.sg_egress_rules
}

module "launch_template_module" {
  source = "./launch-templete"

  launch_template_name             = var.launch_template_name
  instance_type                    = var.instance_type
  ami_id                           = var.ami_id
  key_pair_name                    = var.key_pair_name
  cpu_opt_core_count               = var.cpu_opt_core_count
  cpu_opt_threads_per_core         = var.cpu_opt_threads_per_core
  credit_specification_cpu_credits = var.credit_specification_cpu_credits
  capacity_reservation_preference  = var.capacity_reservation_preference
  availability_zone                = var.availability_zone
  security_group_ids               = [module.web_security_group.web_sg_id]
}

module "auto_scaling_module" {
  source = "./auto-scaling"

  auto_scaling_group_name  = var.auto_scaling_group_name
  launch_template_id       = module.launch_template_module.launch_template_id
  scaling_min_size         = var.scaling_min_size
  scaling_max_size         = var.scaling_max_size
  scaling_desired_capacity = var.scaling_desired_capacity
  vpc_zone_identifier      = var.vpc_zone_identifier
  target_cpu_utilization   = var.target_cpu_utilization
}