locals {
  organizational_units = var.organizational_units == null ? [] : jsondecode(var.organizational_units)["units"]
}

resource "aws_organizations_organizational_unit" "unit" {
  for_each = toset(local.organizational_units)

  name      = each.key
  parent_id = var.new_organization ? aws_organizations_organization.organization[0].roots[0].id : var.parent_id

  tags = var.tags
}

resource "aws_organizations_policy" "policy" {
  for_each = { for op in var.organizations_policies : op.name => op }

  name = each.key

  type        = each.value.type
  description = each.value.description
  content     = file("${path.module}/Policies/${each.value.policy_name}")

  tags = var.tags
}

resource "aws_organizations_policy_attachment" "unit" {
  for_each = { for op in var.organizations_policies : op.name => op }

  policy_id = aws_organizations_policy.policy[each.key].id
  target_id = var.parent_id
}
