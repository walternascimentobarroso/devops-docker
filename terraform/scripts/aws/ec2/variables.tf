variable "environment" {
  type        = string
  description = "The environment to deploy to"
}

variable "aws_region" {
  type        = string
  description = "The AWS region to deploy to"
}

variable "aws_ami" {
  type        = string
  description = "The AMI to use for the EC2 instance"
}

variable "aws_instance_type" {
  type        = string
  description = "The instance type to use for the EC2 instance"
}

variable "aws_instance_tags" {
  type        = map(string)
  description = "The tags to apply to the EC2 instance"
  default = {
    Name    = "Main Instance Name"
    Project = "Terraform Configuration"
  }
}