# -------------------------------------------------------------------------------------------------
# IAM User
# -------------------------------------------------------------------------------------------------
resource "aws_iam_user" "this" {
  count         = var.enabled ? 1 : 0
  name          = var.name
  path          = var.path
  force_destroy = true
  tags          = var.tags
}


resource "aws_iam_access_key" "this" {
  count = var.enabled ? 1 : 0
  user  = element(concat(aws_iam_user.this.*.name, [""]), 0)
}


# -------------------------------------------------------------------------------------------------
# Attach Inline Policies
# -------------------------------------------------------------------------------------------------
data "aws_iam_policy_document" "this_inline" {
  count = var.enabled ? length(var.inline_policies) : 0

  dynamic "statement" {
    for_each = var.inline_policies[count.index].statements

    content {
      sid       = lookup(statement.value, "sid", "")
      effect    = lookup(statement.value, "effect", "Allow")
      actions   = lookup(statement.value, "actions")
      resources = statement.value.resources
    }
  }
}

resource "aws_iam_user_policy" "this_inline" {
  count  = var.enabled ? length(var.inline_policies) : 0
  name   = lookup(var.inline_policies[count.index], "name")
  user   = element(concat(aws_iam_user.this.*.name, [""]), 0)
  policy = data.aws_iam_policy_document.this_inline[count.index].json
}


# -------------------------------------------------------------------------------------------------
# Create and attach Custom Policies
# -------------------------------------------------------------------------------------------------
data "aws_iam_policy_document" "this_custom" {
  count = var.enabled ? length(var.custom_policies) : 0

  dynamic "statement" {
    for_each = var.custom_policies[count.index].statements

    content {
      sid       = lookup(statement.value, "sid", "")
      effect    = lookup(statement.value, "effect", "Allow")
      actions   = lookup(statement.value, "actions")
      resources = statement.value.resources
    }
  }
}

resource "aws_iam_policy" "this_custom" {
  count  = var.enabled ? length(var.custom_policies) : 0
  name   = lookup(var.custom_policies[count.index], "name")
  path   = lookup(var.custom_policies[count.index], "path", "/")
  policy = data.aws_iam_policy_document.this_custom[count.index].json
}

resource "aws_iam_user_policy_attachment" "this_custom" {
  count      = var.enabled ? length(var.custom_policies) : 0
  user       = element(concat(aws_iam_user.this.*.name, [""]), 0)
  policy_arn = aws_iam_policy.this_custom[count.index].arn
}


# -------------------------------------------------------------------------------------------------
# Attach policy ARN's
# -------------------------------------------------------------------------------------------------
resource "aws_iam_user_policy_attachment" "this_arn" {
  count      = var.enabled ? length(var.attach_policy_arns) : 0
  user       = element(concat(aws_iam_user.this.*.name, [""]), 0)
  policy_arn = var.attach_policy_arns[count.index]
}
