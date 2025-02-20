import json
import boto3
from PIL import Image
from io import BytesIO

def lambda_handler(event, context):
    try:
        print('Event:', event)
        s3_event = event['Records'][0]['s3']

        # Extract relevant information
        bucket_name = s3_event['bucket']['name']
        object_key = s3_event['object']['key']

        print(f"Bucket Name: {bucket_name}")
        print(f"Object Key: {object_key}")

        # Example: Download the object content
        s3_client = boto3.client('s3')
        response = s3_client.get_object(Bucket=bucket_name, Key=object_key)
        object_content = response['Body'].read()

        # Open image and resize it
        image = Image.open(BytesIO(object_content))
        image = image.resize((500, 500))

        # Convert image back to bytes
        resized_buffer = BytesIO()
        image.save(resized_buffer, format="JPEG") # save image in original format
        resized_buffer.seek(0) # set pointer back to the beginning of the buffer

        # Upload the resized image to the S3 Bucket in /resized directory
        resized_response = s3_client.put_object(
          Bucket=bucket_name,
          Key=f"resized/{object_key}_500_500.jpg",
          Body=resized_buffer,
          ContentType='image/jpeg'
        )

        print(f"Resized Response: {resized_response}")

        return {
            'statusCode': 200,
            'body': json.dumps('Image resized successfully!')
        }
    except Exception as ex:
        print(f"Error: {ex}")
