// * Typescript Types

let bucketName: string = 'my-bucket-dh';
let maxItems: number = 100;
let isPublic: boolean = false;
let tags: string[] = ['project:cdk', 'env:dev'];

// * Typescript Interface

interface MyBucketProps {
  bucketName: string;
  versioned: boolean;
  encryption: S3.BucketEncryption;
}
