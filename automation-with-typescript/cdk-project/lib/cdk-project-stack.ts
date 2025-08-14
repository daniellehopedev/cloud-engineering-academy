import * as cdk from 'aws-cdk-lib';
import { Construct } from 'constructs';
// import * as sqs from 'aws-cdk-lib/aws-sqs';

interface MyBucketProps {
  bucketName: string;
  versioned: boolean;
  encryption: S3.BucketEncryption;
}

//* The CdkProjectStack class is a type of a Stack
//* Stack represents a CloudFormation Stack - collection of AWS resources
export class CdkProjectStack extends cdk.Stack {
  //* Constructor - this method is called when creating a new instance of this Stack and sets up the initial state
  //* scope: Construct - parent of the Stack
  //* id: string - unique identifier of the Stack
  //* props?: cdk.StackProps - optional

  constructor(scope: Construct, id: string, props?: cdk.StackProps) {
    //* calls the constructor of the parent cdk Class - it is necessary to set up the stack properly
    super(scope, id, props);

    const bucketProps: MyBucketProps = {
      bucketName: 'My-S3-Bucket-SS-CDK-' + this.account,
      versioned: true,
      encryption: s3.BucketEncryption.S3_MANAGED,
    };

    new s3.Bucket(this, 'MyFirstBucket', bucketProps);
  }
}
