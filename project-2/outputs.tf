output "vpc_id" {
  description = "ID of the VPC"
  value       = module.vpc.vpc_id
}

output "vpc_cidr_block" {
  description = "CIDR block of the VPC"
  value       = module.vpc.vpc_cidr_block
}

output "public_subnet_ids" {
  description = "IDs of the public subnets"
  value       = module.networking.public_subnet_ids
}

output "private_subnet_ids" {
  description = "IDs of the private subnets"
  value       = module.networking.private_subnet_ids
}

output "internet_gateway_id" {
  description = "ID of the Internet Gateway"
  value       = module.vpc.internet_gateway_id
}

output "nat_gateway_id" {
  description = "ID of the NAT Gateway"
  value       = module.networking.nat_gateway_id
}

output "public_security_group_id" {
  description = "ID of the public security group"
  value       = module.security.public_security_group_id
}

output "private_security_group_id" {
  description = "ID of the private security group"
  value       = module.security.private_security_group_id
}

output "bastion_security_group_id" {
  description = "ID of the bastion security group"
  value       = module.security.bastion_security_group_id
}

output "public_ec2_instance_id" {
  description = "ID of the public EC2 instance"
  value       = module.ec2.public_ec2_instance_id
}

output "private_ec2_instance_id" {
  description = "ID of the private EC2 instance"
  value       = module.ec2.private_ec2_instance_id
}

output "bastion_ec2_instance_id" {
  description = "ID of the bastion host EC2 instance"
  value       = module.ec2.bastion_ec2_instance_id
}

output "public_ec2_public_ip" {
  description = "Public IP of the public EC2 instance"
  value       = module.ec2.public_ec2_public_ip
}

output "bastion_ec2_public_ip" {
  description = "Public IP of the bastion host"
  value       = module.ec2.bastion_ec2_public_ip
}