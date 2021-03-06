######################
# Pull TFE Variables #
######################

variable "TFE_Token" {}
variable "Email" {}
variable "oAuth_Token_ID" {}
variable "Github_Token" {}
variable "Environment" {}
variable "AWS_ACCESS_KEY_ID" {}
variable "AWS_SECRET_ACCESS_KEY" {}

###################
# TF Variable Map #
###################

variable "sensitive_vars" {
  type        = map(string)
  description = "Map of Sensitive TFE Values."

  default = {
    Email                 = "NULL"
    oAuth_Token_ID        = "NULL"
    TFE_Token             = "NULL"
    Github_Token          = "NULL"
    Environment           = "NULL"
    AWS_ACCESS_KEY_ID     = "NULL"
    AWS_SECRET_ACCESS_KEY = "NULL"
  }
}

###########################
# Github Repository Tuple #
###########################

variable "github_names" {
  type        = list(map(string))
  description = "List of Github Repository Names/Descriptions/GitIgnore Template."

  default = [
    {
      name               = "dotfiles"
      description        = "Dotfiles live here."
      gitignore_template = "Python"
    },
    {
      name               = "Terrafixit"
      description        = "I watch specific TF workspaces and tell you when they have failures and who dunnit."
      gitignore_template = "Python"
    },
    {
      name               = "terraform-provider-tdameritrade"
      description        = "The Terraform plugin for the TD Ameritrade provider."
      gitignore_template = "Go"
    }
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

  default = "Mothership"
}
