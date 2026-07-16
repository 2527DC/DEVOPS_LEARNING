output "public_ec2_instance_id" {
  description = "ID of the public EC2 instance"
  value       = aws_instance.public.id
}

output "private_ec2_instance_id" {
  description = "ID of the private EC2 instance"
  value       = aws_instance.private.id
}

output "bastion_ec2_instance_id" {
  description = "ID of the bastion host EC2 instance"
  value       = aws_instance.bastion.id
}

output "public_ec2_public_ip" {
  description = "Public IP of the public EC2 instance"
  value       = aws_instance.public.public_ip
}

output "bastion_ec2_public_ip" {
  description = "Public IP of the bastion host"
  value       = aws_instance.bastion.public_ip
}

output "private_ec2_private_ip" {
  description = "Private IP of the private EC2 instance"
  value       = aws_instance.private.private_ip
}

output "load_balancer_dns_name" {
  description = "DNS name of the internal load balancer"
  value       = aws_lb.private_app.dns_name
}

output "target_group_arn" {
  description = "ARN of the target group"
  value       = aws_lb_target_group.private_app.arn
}