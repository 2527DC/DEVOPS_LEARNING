variable "cpu_opt_core_count" {
  description = "Number of vCPUs to assign to the instance"
  type        = number
  default     = 1
}

variable "cpu_opt_threads_per_core" {
  description = "Number of threads per core"
  type        = number
  default     = 1
}

variable "credit_specification_cpu_credits" {
  description = "Credit option for T2/T3 instances"
  type        = string
  default     = "standard"
}

variable "key_pair_name" {
  description = "Name of the key pair"
  type        = string
  default     = "practice-scaling"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "AMI ID for the instance"
  type        = string
  default     = "ami-01a00762f46d584a1"
}



variable "launch_template_name" {
  description = "Name of the launch template"
  type        = string
  default     = "test"
}

variable "security_group_ids" {
  description = "List of security group IDs to associate with the launch template"
  type        = list(string)
  default     = []
}

variable "capacity_reservation_preference" {
  description = "Capacity reservation preference"
  type        = string
  default     = "open"
}

variable "availability_zone" {
  description = "Availability Zone"
  type        = string
}
