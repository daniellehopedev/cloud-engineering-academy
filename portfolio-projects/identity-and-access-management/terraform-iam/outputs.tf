# Group Information
output "developer_group_name" {
  description = "Name of the developer IAM group"
  value       = aws_iam_group.developer_group.name
}

output "operations_group_name" {
  description = "Name of the operations IAM group"
  value       = aws_iam_group.operations_group.name
}

output "finance_group_name" {
  description = "Name of the finance IAM group"
  value       = aws_iam_group.finance_group.name
}

output "data_group_name" {
  description = "Name of the data IAM group"
  value       = aws_iam_group.data_group.name
}

# User Information
output "all_user_names" {
  description = "List of all created IAM user names"
  value = [
    aws_iam_user.developer_user_one.name,
    aws_iam_user.developer_user_two.name,
    aws_iam_user.developer_user_three.name,
    aws_iam_user.developer_user_four.name,
    aws_iam_user.operations_user_one.name,
    aws_iam_user.operations_user_two.name,
    aws_iam_user.finance_manager_user.name,
    aws_iam_user.data_analyst_user_one.name,
    aws_iam_user.data_analyst_user_two.name,
    aws_iam_user.data_analyst_user_three.name
  ]
}

output "all_user_arns" {
  description = "List of all created IAM user ARNs"
  value = [
    aws_iam_user.developer_user_one.arn,
    aws_iam_user.developer_user_two.arn,
    aws_iam_user.developer_user_three.arn,
    aws_iam_user.developer_user_four.arn,
    aws_iam_user.operations_user_one.arn,
    aws_iam_user.operations_user_two.arn,
    aws_iam_user.finance_manager_user.arn,
    aws_iam_user.data_analyst_user_one.arn,
    aws_iam_user.data_analyst_user_two.arn,
    aws_iam_user.data_analyst_user_three.arn
  ]
}

# Team Summaries
output "team_summary" {
  description = "Summary of teams and member counts"
  value = {
    developers = length(aws_iam_group_membership.developer_team.users)
    operations = length(aws_iam_group_membership.operations_team.users)
    finance    = length(aws_iam_group_membership.finance_team.users)
    data       = length(aws_iam_group_membership.data_team.users)
  }
}