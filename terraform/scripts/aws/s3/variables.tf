variable "environment" {
  type        = string
  description = "The environment to deploy to"
}

variable "company" {
  type        = string
  description = "The company name"
}

variable "aws_region" {
  type        = string
  description = "The AWS region to deploy to"
}

variable "aws_s3_tags" {
  type        = map(string)
  description = "The tags to apply to the S3 bucket"
}