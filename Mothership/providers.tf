##########################
# Version Lock to Latest #
##########################

terraform {
  required_providers {
    tfe = {
      version = "~> 0.24.0"
    }

    github = {
      source  = "integrations/github"
      version = "4.3.1"
    }

    # aws = {
    #   source  = "hashicorp/aws"
    #   version = "~> 3.0"
    # }
  }

  required_version = ">= 0.14"

  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "DioTFE"

    workspaces {
      name = "IaC"
    }
  }
}

################
# AWS Provider #
################

# Figure out how the assume role resource works
# provider "aws" {
#   region = "us-east-2"

#   assume_role {
#     role_arn = ""
#     session_name = ""
#   }
# }

################
# TFE Provider #
################

provider "tfe" {
  token = local.tfe_token
}

###################
# Github Provider #
###################

provider "github" {
  token = local.github_token
}
