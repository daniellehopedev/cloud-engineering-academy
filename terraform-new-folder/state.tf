# top level block that defines the settings for the terraform behavior and backend configuration.
terraform { 
  # configuration for setting up a remote backend for storing the state file.
  backend "s3" { # backend type is s3
    bucket = "dh-tf-state-locks"
    key = "global/s3/terraform.tfstate" # path to the state file in the bucket
    region = "us-east-1"
    dynamodb_table = "tf-state-lock-files" # used for state locking and consistency checking
  }
}

# Create the DynamoDB table and S3 bucket manually to avoid having the backend infrastructure deploy as code.
# Avoids deletion the table and s3 bucket when running terraform destroy and losing your state file.

# why use remote backend?
# 1. better collaboration
# 2. security
# 3. state locking
# 4. recovery
