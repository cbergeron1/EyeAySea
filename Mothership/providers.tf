##########################
# Version Lock to Latest #
##########################

terraform {
  required_providers {
    tfe = {
      version = "~> 0.24.0"
    }
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



################
# TFE Provider #
################

# Turn token into TFE Variable and Pull
provider "tfe" {
  token = local.tfe_token
}

###################
# Github Provider #
###################

