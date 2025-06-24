# Control Structures / Control Flow

instance_running = 'broken'

# If Statements
if instance_running == 'running':
  # code to execute if condition is True
  print('The EC2 is running')
elif instance_running == 'stopped':
  # code to execute if another_condition is True
  print('The EC2 is stopped...')
else:
  # code to execute if all conditions are False
  print('The EC2 instance is in an unexpected state')

public_access_block = True

if public_access_block == True:
  print('s3 bucket is secured')
else:
  print('s3 bucket is not secure')