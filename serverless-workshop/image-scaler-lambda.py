import json
import boto3

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

        # For learning purposes, we are simply just uploading the same content with an updated Key
        # But for actual resizing there would be other more complex steps to take, you would put that code here
        # Could use a library like PIL for resizing and io for saving the image Bytes

        resized_response = s3_client.put_object(Bucket=bucket_name, Key=f"resized/{object_key}", Body=object_content)

        print(f"Resized Response: {resized_response}")

        return {
            'statusCode': 200,
            'body': json.dumps('Object processed successfully!')
        }
    except Exception as ex:
        print(f"Error: {ex}")
