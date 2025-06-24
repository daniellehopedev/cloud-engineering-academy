# Dictionaries
# - Store and retrieve information
# - Key and Values

# EC2
ec2_instance = {
  "InstanceId": "i-123456abcde",
  "InstanceType": "t2.micro",
  "State": "running",
  "PublicIpAddress": "203.0.111.2"
}

# access a value in a dictionary
instance_type = ec2_instance["InstanceType"]
print(f"this is a {instance_type} instance.")

# using get method, can return a default value if the key does not exist
public_ip = ec2_instance.get("PublicIpAddress", "No Public IP Address.")
print(public_ip)

# adding a new key-value pair
ec2_instance["AvailabilityZone"] = "us-east-1"
ec2_instance["State"] = "stopped"
print(ec2_instance)

# removing data
# using pop()
rm_instance_type = ec2_instance.pop("InstanceType")
print(f"removed instance type: {rm_instance_type}")
print(ec2_instance)

# using del

del ec2_instance["AvailabilityZone"]
print(ec2_instance)