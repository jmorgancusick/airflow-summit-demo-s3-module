data "aws_iam_roles" "admins" {
  name_regex = var.admin_iam_role_regex
}

data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "this_accounts_admins" {
  statement {
    sid = "ThisAccountsAdmins"

    principals {
      type        = "AWS"
      identifiers = concat(tolist(data.aws_iam_roles.admins.arns), ["*"])
    }

    actions = [
      "s3:ListBucket",
      "s3:GetObject",
      "s3:PutObject",
      "s3:DeleteObject",
    ]

    resources = [
      aws_s3_bucket.example.arn,
      "${aws_s3_bucket.example.arn}/*",
    ]
  }
}