import * as cdk from 'aws-cdk-lib';
import { Construct } from 'constructs';
import * as ec2 from 'aws-cdk-lib/aws-ec2';
import * as rds from 'aws-cdk-lib/aws-rds';

interface RDSStackProps extends cdk.StackProps {
  vpc: ec2.Vpc;
}

export class RDSStack extends cdk.Stack {
  constructor(scope: Construct, id: string, props: RDSStackProps) {
    super(scope, id, props);

    // RDS Config
    const rdsInstance = new rds.DatabaseInstance(this, 'RdsInstance', {
      engine: rds.DatabaseInstanceEngine.mysql({
        version: rds.MysqlEngineVersion.VER_8_0_42,
      }),
      vpc: props.vpc,
      vpcSubnets: {
        subnetGroupName: 'Database',
        availabilityZones: [
          props.vpc.availabilityZones[0],
          props.vpc.availabilityZones[1],
        ],
        onePerAz: true,
      },
      instanceType: ec2.InstanceType.of(
        ec2.InstanceClass.T3,
        ec2.InstanceSize.MICRO
      ),
      allocatedStorage: 20,
      maxAllocatedStorage: 30,
      deletionProtection: false,
      removalPolicy: cdk.RemovalPolicy.DESTROY,
    });

    cdk.Tags.of(rdsInstance).add('Name', 'MyRDSDatabase');
  }
}
