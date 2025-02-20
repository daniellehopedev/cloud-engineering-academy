# Serverless Workshop

Simple Lambda function that is triggered by a PUT event to an S3 Bucket.
On upload of a .jpg image, the function will download the image, and resize it.
After resizing, the image is saved and uploaded back to the bucket.
My function simply just resizes the image to 500 x 500.

The image should be uploaded to a directory named 'images'.
After it is uploaded and resized, the image is saved to another directory named 'resized'.

The event notification triggers on upload of a .jpg file, to the 'images' directory.
The Lambda function has a Layer added to it to enable the use of Pillow for processing the image.
The Layer can be found here among other layers: https://github.com/keithrozario/Klayers.
Simply find the ARN compatible with your version of Python and that is available for your region (https://github.com/keithrozario/Klayers/tree/master/deployments/python3.12).

Version of Python used here: 3.12

### Image Scaler Use Case - Architecture

![Image Scaler Use Case - Architecture](/serverless-workshop/images/image-scaler-use-case-architecture.png)
