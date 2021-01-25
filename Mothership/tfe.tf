###############################
# Create Primary Organization #
###############################

# Set email as TFE Var and pull it down
resource "tfe_organization" "primary" {
  name  = "DioTFE"
  email = local.email
}

################################
# Create Primary TFE Workspace #
################################

resource "tfe_workspace" "infrastructure" {
  name         = "IaC"
  organization = tfe_organization.primary.id

  auto_apply        = true
  terraform_version = "0.14.5"
  working_directory = "Mothership"

  # Set oAuth Token to TFE Var and pull value
  vcs_repo {
    identifier     = local.github_identifier
    branch         = "main"
    oauth_token_id = local.oauth_token
  }
}

########################
# Create TFE Variables #
########################

resource "tfe_variable" "primary" {
  for_each     = var.sensitive_vars
  key          = each.key
  value        = each.value
  category     = "terraform"
  workspace_id = tfe_workspace.infrastructure.id
  sensitive    = true

  lifecycle {
    ignore_changes = [
      value,
    ]
  }
}