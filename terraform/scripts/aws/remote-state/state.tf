resource "aws_s3_bucket" "state" {
  bucket = "${var.company}-state-${random_pet.bucket_prefix.id}-${var.environment}"
  tags   = local.common_tags
}

resource "aws_s3_bucket_versioning" "versioning_state" {
  bucket = aws_s3_bucket.state.id
  versioning_configuration {
    status = "Enabled"
  }
}