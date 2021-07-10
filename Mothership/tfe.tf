###############################
# Create Primary Organization #
###############################

resource "tfe_organization" "primary" {
  name  = local.tfe_org
  email = local.email
}

###################################
# Create Mothership TFE Workspace #
###################################

resource "tfe_workspace" "infrastructure" {
  name         = local.tfe_workspace
  organization = tfe_organization.primary.id

  auto_apply        = true
  terraform_version = "1.0.2"
  working_directory = "Mothership"

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
