###############################
# Create Primary Organization #
###############################

# Set email as TFE Var and pull it down
resource "tfe_organization" "primary" {
  name  = "DioTFE"
  email = "cjberger1993@outlook.com"
}

resource "tfe_workspace" "infrastructure" {
  name         = "IaC"
  organization = "DioTFE"

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