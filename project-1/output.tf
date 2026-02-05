output "tf_aws_public" {
    value = aws_instance.tf_aws.public_ip
}
output "tf_aws_instance_id" {
  value = aws_instance.tf_aws.id
}