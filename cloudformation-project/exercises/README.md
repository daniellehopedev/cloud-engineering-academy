# Cloudformation Exercises

#### Exercise - Create IAM User, User Group, Role, and Policy with Cloudformation.

- Created an IAM User and an IAM User Group, then added the created user to the group.
- Created an IAM Role and an IAM Policy, then attached the role to the policy.
- Code: [iam.yaml](/cloudformation-project/exercises/iam.yaml)

#### Exercise - Application Load Balancer (ALB)

- Create a VPC with 2 Availability Zones.
- Each Availability Zones consists of 1 Public Subnet and 2 Private Subnets (Application and Data)
- Created an Internet Gateway and attached it to the VPC.
- There is also a Route Table with a Public Route that is associated with the Public Subnet in the first AZ, for routing to the Internet Gateway.
- Created a Load Balancer that listens for HTTP traffic on port 80, then forwards the traffic to a Target Group for the Web Servers (EC2s) in the Public Subnets of both AZs.
- Each Web Server (EC2) is configured to start up the httpd service using User Data bash script and print out a simple message for simple verification on which server is being interacted with.
- Code: [ec2.yaml](/cloudformation-project/exercises/ec2.yaml)
- Architecture: ![Application Load Balancer Architecture](/cloudformation-project/images/cloudformation-alb.png)

#### Exercise - Auto Scaling Group

- Same basic setup as the Application Load Balancer exercise as far as the VPC, Availability Zones, and Subnets.
- Created an Auto Scaling Group configured with a Launch Template to spin up 2 EC2s.
  - Desired number of instances to be running is 2, at minimum there should be 1 running, and at maximum the number of instances can scale to 3.
  - The instances will be spun up in the Public Subnets.
- Launch Template is configured to spin up an EC2 instance that will be set up to run as a Web Server.
  - UserData is defined with a bash script to install and start up the httpd service.
- There is also a Scaling Policy that has a CloudWatch Alarm attached
  - Will scale up 1 instance with a gap of 5 minutes to give enough time for start up
  - The Alarm will trigger when the CPU Capacity exceeds 70%.
- Code: [asg.yaml](/cloudformation-project/exercises/asg.yaml)
- Architecture: ![Auto Scaling Group Architecture](/cloudformation-project/images/cloudformation-asg.png)

#### Exercise - S3 to Store a Static Website

- Created an S3 Bucket associated with a Bucket Policy
  - The policy will allow access to the object
- The bucket will be used to host a static index.html page
  - [index.html](/cloudformation-project/exercises/index.html)
- Code: [s3-static.yaml](/cloudformation-project/exercises/s3-static.yaml)
- Architecture: ![S3 Static Web Page Storage](/cloudformation-project/images/cloudformation-s3.png)
- Other simple s3 bucket creation: [s3-bucket-exercise.yaml](/cloudformation-project/exercises/s3-bucket-exercise.yaml)

#### Exercise - Create RDS Instance

- Created an RDS instance configured with username and password.
- Instance will be a MySQL RDS instance
- Code: [rds.yaml](/cloudformation-project/exercises/rds.yaml)
