provider "aws" {
  region = "us-east-1"
}

# Workflow
# Write
# Terraform Init
# Terraform Plan
# Terraform Apply
# Terraform Destroy

# VPC
resource "aws_vpc" "main-tf-vpc" {
  cidr_block = "192.168.0.0/16"

  tags = {
    Name = "main-tf-vpc"
  }
}

# Subnet 1
resource "aws_subnet" "main-tf-subnet-1" {
  vpc_id = aws_vpc.main-tf-vpc.id
  cidr_block = "192.168.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "main-tf-subnet-1"
  }
}

# Subnet 2
resource "aws_subnet" "main-tf-subnet-2" {
  vpc_id = aws_vpc.main-tf-vpc.id
  cidr_block = "192.168.2.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "main-tf-subnet-2"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "main-tf-igw" {
  vpc_id = aws_vpc.main-tf-vpc.id

  tags = {
    Name = "main-tf-igw"
  }
}

# Route Table
resource "aws_route_table" "main-tf-route-table" {
  vpc_id = aws_vpc.main-tf-vpc.id

  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.main-tf-igw.id
    }

  tags = {
    Name = "main-tf-route-table"
  }
}

# Route Table Association - Subnet 1
resource "aws_route_table_association" "main-tf-rt-association-a" {
  subnet_id = aws_subnet.main-tf-subnet-1.id
  route_table_id = aws_route_table.main-tf-route-table.id
}

# Route Table Association - Subnet 2
resource "aws_route_table_association" "main-tf-rt-association-b" {
  subnet_id = aws_subnet.main-tf-subnet-2.id
  route_table_id = aws_route_table.main-tf-route-table.id
}