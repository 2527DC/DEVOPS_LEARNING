variable "auto_scaling_group_name" {
  description = "Name of the autoscaling group"
  type        = string
}

variable "launch_template_id" {
  description = "ID of the launch template"
  type        = string
}

variable "scaling_min_size" {
  description = "Minimum size of the autoscaling group"
  type        = number
}

variable "scaling_max_size" {
  description = "Maximum size of the autoscaling group"
  type        = number
}

variable "scaling_desired_capacity" {
  description = "Desired capacity of the autoscaling group"
  type        = number
}

variable "vpc_zone_identifier" {
  description = "List of subnet IDs to launch resources in"
  type        = list(string)
}

variable "target_cpu_utilization" {
  description = "Target average CPU utilization percentage for scaling"
  type        = number
  default     = 50
}
