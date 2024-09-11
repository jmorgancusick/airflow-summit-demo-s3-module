variable "bucket_name" {
  description = "The s3 bucket name"
  type        = string
}

variable "admin_iam_role_regex" {
  description = "A regex to match IAM roles that will have r/w permission on the s3 bucket"
  type        = string
  default     = "(AWSReservedSSO_AWSAdministratorAccess_|github_actions_admin).*"
}