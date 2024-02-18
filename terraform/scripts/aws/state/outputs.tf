output "bucket_state_name" {
  description = "The name of the bucket created"
  value       = aws_s3_bucket.state.id
}
