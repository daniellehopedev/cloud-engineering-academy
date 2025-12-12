provider "aws" {
  region = "us-east-1"
}

# Developer Group
resource "aws_iam_group" "developer_group" {
  name = "developers"
}

# Developer Group Policies
resource "aws_iam_group_policy_attachment" "developer_ec2_policy" {
  group = aws_iam_group.developer_group.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

resource "aws_iam_group_policy_attachment" "developer_s3_policy" {
  group = aws_iam_group.developer_group.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}

resource "aws_iam_group_policy_attachment" "developer_cloudwatch_policy" {
  group = aws_iam_group.developer_group.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchEventsFullAccess"
}

# Operations Group
resource "aws_iam_group" "operations_group" {
  name = "operations"
}

# Operations Group Policies
resource "aws_iam_group_policy_attachment" "operations_ec2_policy" {
  group = aws_iam_group.operations_group.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

resource "aws_iam_group_policy_attachment" "operations_cloudwatch_policy" {
  group = aws_iam_group.operations_group.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchEventsFullAccess"
}

resource "aws_iam_group_policy_attachment" "operations_system_admin_policy" {
  group = aws_iam_group.operations_group.name
  policy_arn = "arn:aws:iam::aws:policy/job-function/SystemAdministrator"
}

resource "aws_iam_group_policy_attachment" "operations_rds_policy" {
  group = aws_iam_group.operations_group.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonRDSFullAccess"
}

# Finance Group
resource "aws_iam_group" "finance_group" {
  name = "finance"
}

# Finance Group Policies
resource "aws_iam_group_policy_attachment" "finance_billing_policy" {
  group = aws_iam_group.finance_group.name
  policy_arn = "arn:aws:iam::aws:policy/AWSBillingReadOnlyAccess"
}

# Data Group
resource "aws_iam_group" "data_group" {
  name = "data"
}

# Data Group Policies
resource "aws_iam_group_policy_attachment" "data_s3_policy" {
  group = aws_iam_group.data_group.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}

resource "aws_iam_group_policy_attachment" "data_rds_policy" {
  group = aws_iam_group.data_group.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonRDSReadOnlyAccess"
}

# Users
resource "aws_iam_user" "developer_user_one" {
  name = "developer_one"
  path = "/developers/"
}

resource "aws_iam_user" "developer_user_two" {
  name = "developer_two"
  path = "/developers/"
}

resource "aws_iam_user" "developer_user_three" {
  name = "developer_three"
  path = "/developers/"
}

resource "aws_iam_user" "developer_user_four" {
  name = "developer_four"
  path = "/developers/"
}

resource "aws_iam_user" "operations_user_one" {
  name = "operations_one"
  path = "/operations/"
}

resource "aws_iam_user" "operations_user_two" {
  name = "operations_two"
  path = "/operations/"
}

resource "aws_iam_user" "finance_manager_user" {
  name = "finance_manager"
  path = "/finance/"
}

resource "aws_iam_user" "data_analyst_user_one" {
  name = "data_analyst_one"
  path = "/data/"
}

resource "aws_iam_user" "data_analyst_user_two" {
  name = "data_analyst_two"
  path = "/data/"
}

resource "aws_iam_user" "data_analyst_user_three" {
  name = "data_analyst_three"
  path = "/data/"
}

# Group Memberships
resource "aws_iam_group_membership" "developer_team" {
  name = "developer-group-membership"

  users = [
    aws_iam_user.developer_user_one.name, 
    aws_iam_user.developer_user_two.name, 
    aws_iam_user.developer_user_three.name, 
    aws_iam_user.developer_user_four.name
  ]

  group = aws_iam_group.developer_group.name
}

resource "aws_iam_group_membership" "operations_team" {
  name = "operations-group-membership"

  users = [
    aws_iam_user.operations_user_one.name, 
    aws_iam_user.operations_user_two.name
  ]

  group = aws_iam_group.operations_group.name
}

resource "aws_iam_group_membership" "finance_team" {
  name = "finance-group-membership"

  users = [
    aws_iam_user.finance_manager_user.name
  ]

  group = aws_iam_group.finance_group.name
}

resource "aws_iam_group_membership" "data_team" {
  name = "data-group-membership"

  users = [
    aws_iam_user.data_analyst_user_one.name,
    aws_iam_user.data_analyst_user_two.name,
    aws_iam_user.data_analyst_user_three.name
  ]

  group = aws_iam_group.data_group.name
}

