# Project Brief

### Client Background

You are a Cloud Engineer Consultant, working with StartupCo, a fast-growing tech startup that recently launched their first product - a fitness tracking application.

They’ve been using AWS for three months, initially setting up their infrastructure quickly to meet launch deadlines.

Now that their product is live, they need to address their cloud security fundamentals. The company has 10 employees who all currently share the AWS root account credentials to access and manage their cloud resources.

This practice started when they were moving quickly to launch, but now their CTO recognizes the security risks this poses.

### Current Setup:

- Everyone uses the root account
- No separate permissions for different teams
- No MFA or password policies
- AWS credentials shared via team chat

### Current Infrastructure:

- EC2 instances running their application
- S3 buckets storing user data and application assets
- RDS database for user information
- CloudWatch for monitoring
- Several development and production environments

### Team Structure & Access Needs:

- 4 Developers (need EC2 and S3 access)
- 2 Operations (need full infrastructure access)
- 1 Finance Manager (needs cost management access)
- 3 Data Analysts (need read-only access to data resources)

### Tasks

1. Create the Architecture
   - Create an architecture diagram showcasing their current infrastructure
2. Secure the Root Account
   - Enable MFA
   - Stop using it for daily operations
   - Store credentials securely
3. Create IAM Users and Groups
   - Developer group & users
   - Operations group & users
   - Finance group & user
   - Analyst group & users
4. Set Up Security Requirements
   - Enable MFA for all users
   - Create a strong password policy
   - Ensure users can only access what they need
5. Implement These Permissions
   - Developers:
     - EC2 management
     - S3 access for application files
     - CloudWatch logs viewing
   - Operations:
     - Full EC2, CloudWatch access
     - Systems Manager access
     - RDS management
   - Finance:
     - Cost Explorer
     - AWS Budgets
     - Read-only resource access
   - Analysts:
     - Read-only S3 access
     - Read-only database access

### Notes

1. ![StartupCo Architecture](/portfolio-projects/identity-and-access-management/architecture/initial-architecture.png)
2. This actually means Secure the "Management Account".
   The Management Account is created when you initially set up your AWS Account and it has a Root User, it is technically created inside of an AWS Organization. MFA can be enabled for more security.
   The Root User is not to be used for day to day activity, it is ideal to create an Admin User.
   As the Admin user, create another account or "admin" account to set up infrastructure and other users.
   Doesn't have to actually be called an "admin" account, just something to differentiate the what the account is for or is supposed to function as.
   The Management Account should only really be used for creating/managing other accounts inside of an AWS Organization or viewing Billing.
   The above is for an ideal situation but for learning purposes this can be done with just your Admin user, no need to go through the step of creating another account.
3. Use the Admin User to create the User Groups and Users.
   There will be the Developer, Operations, Finance, and Analyst groups.
   Then create the Users and attach each user to their respective group.
4. (And 5.) For the permissions you would attach the needed policies to the group and not to the individual users.
   You could use the pre-configured "job function" policies but ideally you want to be able to fine tune the permissions.
   This will allow you to properly implement least privilege and give the access that is actually needed.
   With the "job function" policies there could be instances where you can give someone access that they don't really need.
   A strong password policy can be attached at the account level, so it is enabled for all of the users within that account.

### IAM Architecture

![IAM Architecture](/portfolio-projects/identity-and-access-management/architecture/ideal-iam-architecture.png)
