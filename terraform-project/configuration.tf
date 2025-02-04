# Providers - Define which cloud providers or services Terraform will interact with
provider "aws" {
  region = "us-east-1"
}

# Resources - Describe the infrastructure components you want to create
resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0" # Example AMI ID
  instance_type = "t2.micro"
  tags = {
    Name = "Ec2-Instance"
  }
}

# Variables help make your configurations more flexible and reusable
variable "instant_type" {
  description = "The type of instance to create"
  default     = "t2.micro"
}

resource "aws-instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = var.instance_type
  tags = {
    Name = "Ec2-Instance"
  }
}

# Outputs - Specifies the output values you want to retrieve after applying your configuration
output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.example.id
}