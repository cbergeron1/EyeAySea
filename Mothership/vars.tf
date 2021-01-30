#####################
# Locals Definition #
#####################

locals {
  email             = var.Email
  tfe_token         = var.TFE_Token
  oauth_token       = var.oAuth_Token_ID
  github_org        = var.github_org
  github_repo       = var.repo_name
  github_identifier = format("%s/%s", local.github_org, local.github_repo)
  github_token      = var.Github_Token
  tfe_org           = var.tfe_org
  tfe_workspace     = var.tfe_workspace
}

######################
# Pull TFE Variables #
######################

variable "TFE_Token" {}
variable "Email" {}
variable "oAuth_Token_ID" {}
variable "Github_Token" {}

###################
# TF Variable Map #
###################

variable "sensitive_vars" {
  type        = map(string)
  description = "Map of Sensitive TFE Values."

  default = {
    Email          = "NULL"
    oAuth_Token_ID = "NULL"
    TFE_Token      = "NULL"
    Github_Token   = "NULL"
  }
}

###########################
# Github Repository Tuple #
###########################

variable "github_names" {
  type = list(map(string))
  description = "List of Github Repository Names/Descriptions/GitIgnore Template."

  default = [
    {
      name = "Ticker"
      description = "Python Discord bot to pull stock information when passed a ticker."
      gitignore_template = "Python"
    },
    {
      name = "Ticker2"
      description = "Python Discord bot to pull stock information when passed a ticker."
      gitignore_template = "Python"
    },
  ]
}

###########################
# Variables with Defaults #
###########################

variable "github_org" {
  type        = string
  description = "Github Organization name."

  default = "cbergeron1"
}

variable "repo_name" {
  type        = string
  description = "Github Repository name."

  default = "EyeAySea"
}

variable "tfe_org" {
  type        = string
  description = "Name of the TFE Organization you want to create."

  default = "DioTFE"
}

variable "tfe_workspace" {
  type        = string
  description = "Name of the TFE Workspace you want to create."

  default = "IaC"
}