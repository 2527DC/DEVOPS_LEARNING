variable "region" {
  description = "AWS region"
  type        = string
}

variable "web_sg_name" {
  description = "Security group name"
  type        = string
}

variable "web_sg_description" {
  description = "Security group description"
  type        = string
  default     = "Managed by Terraform"
}

variable "vpc_id" {
  description = "VPC ID where the SG will be created"
  type        = string
}

variable "sg_ingress_rules" {
  description = "List of ingress rule objects"
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
  description = "List of egress rule objects"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
    description = optional(string)
  }))
  default = []
}

variable "tag_name" {
  description = "Tag name for the SG"
  type        = string
}
