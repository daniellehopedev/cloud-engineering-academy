output "bucket_name" {
  value = aws_s3_bucket.host-bucket.bucket
}

output "cloudfront_url" {
  value = aws_cloudfront_distribution.s3-nextjs-website-distribution.domain_name
}
