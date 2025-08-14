import * as cdk from 'aws-cdk-lib';
import * as s3 from 'aws-cdk-lib/aws-s3';
import { Construct } from 'constructs';
import { S3Bucket } from '@aws-solutions-constructs/aws-s3-bucket';

//* CONSTRUCTS

//* --- L1 Constructs ---
//* low level constructs that directly represent all aws resources available in CloudFormation
//* offer full control but require more configuration
export class L1BucketStack extends cdk.Stack {
  constructor(scope: Construct, id: string, props?: cdk.StackProps) {
    super(scope, id, props);

    new s3.CfnBucket(this, 'MyL1Bucket', {
      bucketName: 'my-l1-bucket-' + this.account,
      versioningConfiguration: {
        status: 'Enabled',
      },
      publicAccessBlockConfiguration: {
        blockPublicAcls: true,
        blockPublicPolicy: true,
        ignorePublicAcls: true,
        restrictPublicBuckets: true,
      },
    });
  }
}

// ---------------------------------------

//* --- L2 Constructs ---
//* higher level intent based constructs
//* provides sensible defaults and encapsulate the details of working with L1 Constructs
//* makes it easier to work with L2 Constructs and follow AWS best practices
export class L2BucketStack extends cdk.Stack {
  constructor(scope: Construct, id: string, props?: cdk.StackProps) {
    super(scope, id, props);

    //* using Bucket instead of CfnBucket
    //* makes it easier to configure and automatically applies best practices like encryption
    new s3.Bucket(this, 'MyL2Bucket', {
      bucketName: 'my-l2-bucket-' + this.account,
      versioned: true,
      encryption: s3.BucketEncryption.S3_MANAGED,
      blockPublicAccess: s3.BlockPublicAccess.BLOCK_ALL,
      removalPolicy: cdk.RemovalPolicy.DESTROY,
    });
  }
}

// -------------------------------------

//* --- L3 Constructs ---
//* highest level construct
//* represent multi-resource patterns or even entire applications
//* use to implement common architectural patterns to speed up development
export class L3BucketStack extends cdk.Stack {
  constructor(scope: Construct, id: string, props?: cdk.StackProps) {
    super(scope, id, props);

    //* automatically applies best practices like encryption, versioning, and access logging
    new S3Bucket(this, 'MyL3Bucket', {
      bucketName: 'my-l3-bucket-' + this.account,
    });
  }
}

// -------------------------------------

//* In general you want to use L2 Constructs and fallback to L1 Constructs when more fine grain control is needed
//* Use and create your own L3 Constructs for more common patterns (big business are more likely to use)
