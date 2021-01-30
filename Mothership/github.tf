###############################
# Managed Github Repositories #
###############################

resource "github_repository" "Ticker" {
  name        = "Ticker"
  description = "Python Discord bot that pulls stock information about the provided ticker."

  visibility         = "private"
  has_issues         = true
  gitignore_template = "Python"
}