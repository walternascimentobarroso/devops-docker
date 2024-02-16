resource "aws_s3_bucket" "bucket" {
  bucket = "${var.company}-${random_pet.bucket_prefix.id}-${var.environment}"
  tags   = local.common_tags
}