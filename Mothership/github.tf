###############################
# Managed Github Repositories #
###############################

resource "github_repository" "Repos" {
  for_each = { for gn in var.github_names : gn.name => gn }
  name        = each.key
  description = each.value.description

  visibility         = "private"
  has_issues         = true
  gitignore_template = each.value.gitignore_template

  lifecycle {
    ignore_changes = [
      gitignore_template,
    ]
  }
}
