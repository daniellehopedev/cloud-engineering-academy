terraform {
  backend "s3" {
    bucket = "dh-nextjs-app-state-files"
    key = "global/s3/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "nextjs-app-state-locks"
  }
}