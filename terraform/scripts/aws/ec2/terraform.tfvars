environment       = "dev"
aws_region        = "us-east-1"
aws_ami           = "ami-0e731c8a588258d0d"
aws_instance_type = "t2.micro"
aws_instance_tags = {
  Name    = "Ubuntu"
  Project = "Terraform Configuration"
  Env     = "Prod"
}