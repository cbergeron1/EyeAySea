#####################
# Locals Definition #
#####################

locals {
  email             = var.Email
  tfe_token         = var.TFE_Token
  oauth_token       = var.oAuth_Token_ID
  github_org        = var.github_org
  github_repo       = var.github_repo
  github_identifier = format("%s/%s", local.github_org, local.github_repo)
}

######################
# Pull TFE Variables #
######################

variable "TFE_Token" {}
variable "Email" {}
variable "oAuth_Token_ID" {}

###################
# TF Variable Map #
###################

variable "sensitive_vars" {
  type        = map(string)
  description = "Map of Sensitive TFE Values"

  default = {
    Email          = "NULL"
    oAuth_Token_ID = "NULL"
    TFE_Token      = "NULL"
  }
}

variable "github_org" {
  type        = string
  description = "Github Organization name"

  default = "cbergeron1"
}

variable "repo_name" {
  type        = string
  description = "Github Repository name"

  default = "EyeAySea"
}