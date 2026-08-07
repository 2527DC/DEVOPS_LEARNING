variable "region" {
    description = "enter aws region"
    type = string
    default = "ap-south-1"
}

variable "ami_id" {
  type = string
  description = "enter ami id"
}

variable "instance_type" {
  type = string
  description = "enter instance type"
  default = "t3.micro"
}

variable "tag_name" {
  type = string
  description = "enter tag name"
}

variable "key_name" {
  type = string
  description = "enter key name"
}

variable "subnet_id" {
  type = string
  description = "enter subnet id"
}

variable "security_group_id" {
  type = string
  description = "enter security group id"
}