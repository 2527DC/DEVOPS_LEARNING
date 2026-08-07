provider "aws" {
  region = var.region
}


resource "aws_launch_template" "practice-launch-template" {
   name =var.launch_templete_name
   image_id = var.ami_id  
   # in the launch templete we can have the option of dont include the launch templete
   instance_type = var.instance_type
   key_name = var.key_name
   
   network_interfaces {
    security_groups = [var.web_sg_id]
    subnet_id = var.subnet_id
   }

}

resource "aws_autoscaling_group" "practice-auto-scaling-group" {
    name = var.auto_scaling_group_name
    launch_template {
        id = aws_launch_template.practice-launch-template.id
        version = "1"
    }
    min_size = var.scaling_min_size
    max_size = var.scaling_max_size
    desired_capacity = var.scaling_desired_capacity

    
}