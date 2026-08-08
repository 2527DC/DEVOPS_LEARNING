resource "aws_launch_template" "example" {
  name = var.launch_template_name


  # cpu_options {
  #   core_count       = var.cpu_opt_core_count
  #   threads_per_core = var.cpu_opt_threads_per_core
  # }

  credit_specification {
    cpu_credits = var.credit_specification_cpu_credits
  }

  disable_api_stop        = false
  disable_api_termination = false

  ebs_optimized = false



  image_id = var.ami_id != "" ? var.ami_id : null

  instance_initiated_shutdown_behavior = "terminate"

  # instance_market_options {
  #   market_type = "spot"
  # }

  instance_type = var.instance_type

  key_name = var.key_pair_name



  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 1
    instance_metadata_tags      = "enabled"
  }

  monitoring {
    enabled = true
  }


  network_interfaces {
    associate_public_ip_address = true
    security_groups             = var.security_group_ids

  }

  # placement {
  #   availability_zone = var.availability_zone
  # }





  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "test"
    }
  }

  
}
