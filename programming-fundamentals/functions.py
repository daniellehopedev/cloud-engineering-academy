import random

def generate_bucket_name(project_name):
  random_suffix = random.randint(1000, 9999)
  bucket_name = f'{project_name}-bucket-{random_suffix}'
  return bucket_name

# Using the function
new_bucket = generate_bucket_name("myproject")
print(f'Created new S3 bucket: {new_bucket}')



# def function_name(parameter1, parameter2):
#   # function body eg, code to be executed
#   return result # Optional
