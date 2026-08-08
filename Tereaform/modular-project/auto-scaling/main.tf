
resource "aws_autoscaling_group" "practice-auto-scaling-group" {
  name = var.auto_scaling_group_name
  launch_template {
    id      = var.launch_template_id
    version = "$Latest"
  }
  min_size         = var.scaling_min_size
  max_size         = var.scaling_max_size
  desired_capacity = var.scaling_desired_capacity

  vpc_zone_identifier       = var.vpc_zone_identifier
  health_check_type         = "EC2"
  health_check_grace_period = 300

  tag {
    key                 = "Name"
    value               = var.auto_scaling_group_name
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_policy" "target_tracking_cpu" {
  name                   = "${var.auto_scaling_group_name}-cpu-policy"
  policy_type            = "TargetTrackingScaling"
  autoscaling_group_name = aws_autoscaling_group.practice-auto-scaling-group.name

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = var.target_cpu_utilization
  }
}