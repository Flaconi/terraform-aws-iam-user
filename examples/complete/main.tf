provider "aws" {
  region = var.region
}

module "terraform_iam_user" {
  source  = "../../"
  name    = "testuser"
  enabled = true

  tags = {}

  inline_policies    = var.inline_policies
  attach_policy_arns = ["arn:aws:iam::aws:policy/AmazonVPCReadOnlyAccess"]
}
