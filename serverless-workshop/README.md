# Serverless Workshop

Simple Lambda function that is triggered by a PUT event to an S3 Bucket.
The PUT event would be an upload of an image to an S3 Bucket,
then this function could act as a service to resize the image,
and upload that image back to the S3 Bucket.
For the learning purposes and scope of the workshop, the main functionality displayed is being able to trigger the Lambda function, parsing the event to read in the object content, and taking that content and doing another upload to S3.

### Image Scaler Use Case - Architecture

![Image Scaler Use Case - Architecture](/serverless-workshop/images/image-scaler-use-case-architecture.png)
