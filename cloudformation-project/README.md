# AWS CloudFormation Project

In this project, we are building out the architecture of the Bastion Host project using IaC with CloudFormation.

#### CloudFormation Architecture

![CloudFormation Architecture](./images/cloudformation-project-architecture.png)

#### Summary

The basic structure is that I have a VPC with 2 Availability Zones (AZs), each AZ has 1 Public Subnet and 2 Private Subnets.
The Public Subnet is for connection to and from the internet, while the Private Subnets are for the Application and Database layer, and can communicate between each other.

The flow is as follows:
You SSH into the Bastion Host EC2 in the Public Subnet from your local machine using a key pair. A Bastion Host is basically a box used to enable connection to and from the internet.
Typically a NAT Gateway would be in place of the Bastion EC2, but because of the cost and learning purposes of this project, it is left out.
Once you SSH into the Bastion EC2, copy the key pair .pem file from your local machine to the EC2, then use that key pair to SSH into the Application Subnet's EC2 at its private IP.
You can create another key pair to SSH into the Application EC2 as a best practice, but for just quickly testing your connection, copying the same key file will work.
After successfully connecting to the Application EC2, ping the Application EC2 in the second AZ at its private IP address.
Each EC2 instance has a Security Group.
The Bastion Host has a Security Group associated with a Public Route Table, so that it can have a Route defined that accepts traffic from your local machine through the Internet Gateway.
The Application EC2 in the first AZ has a Security Group that allows traffic only from the Bastion Host and the Application EC2 in the second AZ has a Security Group that accepts traffic only from the Application EC2 from the first AZ.
