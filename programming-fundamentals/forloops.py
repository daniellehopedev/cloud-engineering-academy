# For Loops

instance_ids = ['i-123456abcs', 'i-23456', 'i-abcde1234']

for instance_id in instance_ids:
  # code to execute for each item
  print(f'Checking status of instance {instance_id}')
  # code to check instance status
  print(f'Instance {instance_id} status check complete')

print('All instances have been checked.')