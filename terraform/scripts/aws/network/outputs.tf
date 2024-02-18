output "bucket_name" {
  description = "The name of the bucket created"
  value       = aws_s3_bucket.bucket.id
}

output "bucket_state_name" {
  description = "The name of the bucket created"
  value       = aws_s3_bucket.state.id
}

output "bucket_arn" {
  description = "The ARN of the bucket created"
  value       = aws_s3_bucket.bucket.arn
}

output "bucket_domain_name" {
  description = "The domain name of the bucket created"
  value       = aws_s3_bucket.bucket.bucket_domain_name
}

output "subnet_id" {
  description = "The ID of the subnet created"
  value       = aws_subnet.subnet.id
}