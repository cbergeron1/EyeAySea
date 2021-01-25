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
  token = "jHjQ9RsNb19WSg.atlasv1.s2tO6Impxy3ddKGP8MXDn45hJ8EIOAYONUAkjjSMoOkl8Xx4fyRVMfzLtzp96hCk1a0"
}

###################
# Github Provider #
###################

