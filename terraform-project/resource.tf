# keyword - resource type - logical name
resource "aws_instance" "myec2" {
  # resource parameters
  ami           = "ami-05576a079321f21f8"
  instance_type = "t2.micro"
  tags = {
    Name = "ec2-instance"
  }
}