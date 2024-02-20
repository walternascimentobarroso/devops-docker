locals {
  common_tags = {
    ManagedBy   = "Terraform"
    Environment = var.environment
    Owner       = "Walter Nascimento Barroso"
  }
}
