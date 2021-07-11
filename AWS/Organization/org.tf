locals {
  new_organization = var.new_organization ? 1 : 0
  service_access   = formatlist("%s.amazonaws.com", var.aws_service_access_principals)
}

// Resource Completed.
resource "aws_organizations_organization" "organization" {
  count = local.new_organization

  aws_service_access_principals = var.feature_set == "ALL" ? local.service_access : null
  enabled_policy_types          = var.feature_set == "ALL" ? var.enabled_policy_types : null
  feature_set                   = var.feature_set
}

// Validate Parent_ID works as expected.
resource "aws_organizations_account" "account" {
  for_each = var.new_accounts

  name  = each.key
  email = each.value

  iam_user_access_to_billing = var.iam_user_access_to_billing
  parent_id                  = var.new_organization ? aws_organizations_organization.organization[0].roots[0].id : null
  role_name                  = var.role_name

  tags = var.tags

  # There is no AWS Organizations API for reading role_name
  lifecycle {
    ignore_changes = [role_name]
  }
}