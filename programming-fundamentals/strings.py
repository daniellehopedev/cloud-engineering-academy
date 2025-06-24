# Single quotes
single_quotes = 'This is an EC2'

# Double quotes
double_quotes = "This is an S3 Bucket"

# Triple quotes for multi-line strings
multi_line = """
This is a CloudFormation template.
Which has multiple lines
"""

print(single_quotes)
print(double_quotes)
print(multi_line)

# Exercise
# Create a single quoted string for an AWS region name
aws_region = 'us-east-1'

# Create a double quoted string for an EC2 instance type
instance_type = "t2.micro"

# Create a multi-line string for a simple IAM policy
iam_policy = """
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:GetObject",
        "s3:PutObject"
      ],
      "Resource": "arn:aws:s3:::my-bucket/*"
    }
  ]
}
"""

# Print all three strings
print(aws_region)
print(instance_type)
print(iam_policy)