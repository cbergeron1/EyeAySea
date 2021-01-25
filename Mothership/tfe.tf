###############################
# Create Primary Organization #
###############################

# Set email as TFE Var and pull it down
resource "tfe_organization" "primary" {
  name  = "DioTFE"
  email = "cjberger1993@outlook.com"
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
    identifier     = "cbergeron1/EyeAySea"
    branch         = "main"
    oauth_token_id = "ot-pKJVpVjwyP2Ytwff"
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
}