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

// The detailed VPC map output was removed because older AWS provider versions do not expose the "vpcs" attribute.
// You can still get the list of VPC IDs via the "vpc_ids" output.
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
  default     = "vpc-0c8ec78cff0f0728d"
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
