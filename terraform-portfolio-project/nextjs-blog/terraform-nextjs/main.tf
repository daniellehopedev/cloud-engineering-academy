provider "aws" {
  region = "us-east-1"
}

# Website S3 bucket
resource "aws_s3_bucket" "host-bucket" {
  bucket = "nextjs-website-host-bucket"

  tags = {
    Name = "nextjs-website-host-bucket"
  }
}

# Ownership control
resource "aws_s3_bucket_ownership_controls" "host-bucket-ownership-controls" {
  bucket = aws_s3_bucket.host-bucket.id
  rule {
    # Bucket owner has full control of the objects in this bucket
    object_ownership = "BucketOwnerPreferred"
  }
}

# Disable public access block settings
resource "aws_s3_bucket_public_access_block" "host-bucket-disable-public-access-block" {
  bucket = aws_s3_bucket.host-bucket.id
  block_public_acls = false
  block_public_policy = false
  ignore_public_acls = false
  restrict_public_buckets = false
}

# Bucket ACL
resource "aws_s3_bucket_acl" "host-bucket-acl" {
  bucket = aws_s3_bucket.host-bucket.id
  depends_on = [
    aws_s3_bucket_ownership_controls.host-bucket-ownership-controls,
    aws_s3_bucket_public_access_block.host-bucket-disable-public-access-block
  ]
  # set access control list to public read
  # allows everyone to read the objects inside the bucket
  acl = "public-read"
}

# S3 bucket policy for allowing public access to the website
resource "aws_s3_bucket_policy" "allow-public-access-policy" {
  bucket = aws_s3_bucket.host-bucket.id
  policy = data.aws_iam_policy_document.allow-public-access-policy-document.json
}

data "aws_iam_policy_document" "allow-public-access-policy-document" {
  statement {
    sid = "PublicReadGetObject"
    effect = "Allow"
    actions = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.host-bucket.arn}/*"]

    principals {
      type = "AWS"
      identifiers = ["*"]
    }
  }
}

# S3 bucket website configuration
resource "aws_s3_bucket_website_configuration" "host-bucket-website-config" {
  bucket = aws_s3_bucket.host-bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

# Origin Access Identity - cloudfront user that gives cloudfront access to the s3 bucket
resource "aws_cloudfront_origin_access_identity" "host-bucket-cloudfront-origin-access-identity" {
  comment = "OAI for the Next.js website."
}

# CloudFront Distribution
resource "aws_cloudfront_distribution" "s3-nextjs-website-distribution" {
  origin {
    domain_name = aws_s3_bucket.host-bucket.bucket_regional_domain_name
    origin_id = "s3-nextjs-website-bucket"

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.host-bucket-cloudfront-origin-access-identity.cloudfront_access_identity_path
    }
  }

  enabled = true
  is_ipv6_enabled = true
  comment = "Next.js blog site."
  default_root_object = "index.html"

  default_cache_behavior {
    allowed_methods = ["GET", "HEAD", "OPTIONS"]
    cached_methods = ["GET", "HEAD"]
    target_origin_id = "s3-nextjs-website-bucket"

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl = 0
    default_ttl = 3600
    max_ttl = 86400
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }

  tags = {
    Name = "s3-nextjs-website-distribution"
  }
}
