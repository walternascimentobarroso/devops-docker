terraform {
  required_version = "1.7.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.37.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "web" {
  ami           = var.aws_ami
  instance_type = var.aws_instance_type
  tags          = var.aws_instance_tags
}