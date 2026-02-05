provider "aws" {
  
  region = var.tf_aws_instace_region

}
data "aws_vpc" "default" {
  default = true
}

resource "aws_security_group" "locked" {
  name        = "locked"
  description = "No inbound access"
  vpc_id      = data.aws_vpc.default.id




  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "locked"
  }
}



resource "aws_instance" "tf_aws" {
ami = var.AMI
key_name = var.key_name

instance_type = var.Instance_type

vpc_security_group_ids = [aws_security_group.locked.id]
  associate_public_ip_address = true 
tags = {
    Name = "tf-aws-ec2"
  }
}