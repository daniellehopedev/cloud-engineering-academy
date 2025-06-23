# Define the AWS account ID
account_id = '123456789012'

# Define the project name
project_name = 'cloud_project'

# Concatenate strings to form the S3 bucket name
bucket_name = account_id + '-' + project_name + '-bucket'

# Print the resulting bucket name
print(bucket_name)
print(f'S3 Bucket Name: {bucket_name}')

# EXERCISE EC2 STRING CONCATENATION

# Environment name prod, dev, or staging
environment = 'dev'

# Application name
application = 'appserver'

# Instance number
instance_number = '02'

# Concatenate
instance_name = environment + '-' + application + '-instance-' + instance_number

# Print
print(f'EC2 Instance Name: {instance_name}')