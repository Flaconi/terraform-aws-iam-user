output "this_aws_iam_user_arn" {
  description = "The IAM User ARN"
  value       = element(concat(aws_iam_user.this.*.arn, [""]), 0)

}

output "this_aws_iam_user_id" {
  description = "The IAM User ID"
  value       = element(concat(aws_iam_user.this.*.id, [""]), 0)
}

output "this_aws_iam_access_key_id" {
  description = "The access key id"
  value       = element(concat(aws_iam_access_key.this.*.id, [""]), 0)
}

output "this_aws_iam_access_key_secret" {
  description = "The access key secret"
  value       = element(concat(aws_iam_access_key.this.*.secret, [""]), 0)
}
