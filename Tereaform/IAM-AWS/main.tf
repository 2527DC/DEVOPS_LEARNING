provider "aws" {
  region = "us-east-1" # Change to your preferred region
}

# 1. Fetch ALL IAM Users in the AWS Account
data "aws_iam_users" "all_users" {}

# 2. Fetch ALL IAM Roles in the AWS Account
data "aws_iam_roles" "all_roles" {}

# 3. Fetch the S3 ReadOnly policy specifically
data "aws_iam_policy" "s3_read_only" {
  arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}

# Note: The AWS provider does not have a native `aws_iam_groups` data source.
# To get a group, you must fetch a specific one by name:
# data "aws_iam_group" "example" {
#   group_name = "example-group"
# }



# 4. Create the IAM User
resource "aws_iam_user" "ec2_handler" {
  name = "ec2servicehandler"
}

# 5. Fetch the EC2 Full Access policy
data "aws_iam_policy" "ec2_full_access" {
  arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

# 6. Attach the policy to the newly created user
resource "aws_iam_user_policy_attachment" "ec2_full_access_attach" {
  user       = aws_iam_user.ec2_handler.name
  policy_arn = data.aws_iam_policy.ec2_full_access.arn
}
# --- Outputs to view the fetched data ---

output "all_iam_user_names" {
  description = "List of all IAM user names in the AWS account"
  value       = data.aws_iam_users.all_users.names
}

output "all_iam_role_names" {
  description = "List of all IAM role names in the AWS account"
  value       = data.aws_iam_roles.all_roles.names
}

output "s3_read_only_policy_arn" {
  description = "ARN of the S3 ReadOnly policy"
  value       = data.aws_iam_policy.s3_read_only.arn
}


