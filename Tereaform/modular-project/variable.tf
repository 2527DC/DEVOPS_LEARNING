## Variable definitions for the modular project

# ------------------------------------------------------------------
# Region – default to Mumbai (ap-south-1)
# ------------------------------------------------------------------
variable "region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "ap-south-1"
}

# ------------------------------------------------------------------
# Common naming variables – you can give them any value you like.
# ------------------------------------------------------------------
variable "web_sg_name" {
  description = "Name of the web security group"
  type        = string
  default     = "web-sg"
}

variable "web_sg_description" {
  description = "Description for the web SG"
  type        = string
  default     = "Security group for web tier"
}

variable "tag_name" {
  description = "Tag value for all resources"
  type        = string
  default     = "demo-project"
}


variable "vpc_id" {
  description = "ID of the VPC where resources are created"
  type        = string
  default     = " "
}

// Security group rule definitions – optional defaults
variable "sg_ingress_rules" {
  description = "List of ingress rule objects for the SG"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
    description = optional(string)
  }))
  default = []
}

variable "sg_egress_rules" {
  description = "List of egress rule objects for the SG"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
    description = optional(string)
  }))
  default = []
}

# ------------------------------------------------------------------
# Launch Template variables
# ------------------------------------------------------------------
variable "launch_template_name" {
  description = "Name of the launch template"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for the instance"
  type        = string
}

variable "key_pair_name" {
  description = "Name of the key pair"
  type        = string
}

variable "cpu_opt_core_count" {
  description = "Number of vCPUs to assign to the instance"
  type        = number
}

variable "cpu_opt_threads_per_core" {
  description = "Number of threads per core"
  type        = number
}

variable "credit_specification_cpu_credits" {
  description = "Credit option for T2/T3 instances"
  type        = string
}

variable "capacity_reservation_preference" {
  description = "Capacity reservation preference"
  type        = string
}

variable "availability_zone" {
  description = "Availability Zone"
  type        = string
}

# ------------------------------------------------------------------
# Auto Scaling variables
# ------------------------------------------------------------------
variable "auto_scaling_group_name" {
  description = "Name of the autoscaling group"
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
