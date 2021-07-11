locals {
  tfe_token    = var.TFE_Token
  github_token = var.Github_Token
}

terraform {
  required_providers {
    tfe = {
      version = "~> 0.24.0"
    }

    github = {
      source  = "integrations/github"
      version = "4.3.1"
    }

    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }

  required_version = ">= 1.0"

  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "DioTFE"

    workspaces {
      name = "Mothership"
    }
  }
}

################
# AWS Provider #
################

provider "aws" {
  region = "us-east-2"

  assume_role {
    role_arn     = "arn:aws:iam::084326137841:role/TerraformAdmin"
    session_name = "Terraform"
  }

  default_tags {
    tags = {
      Environment   = var.Environment
      Provisioner   = "Terraform"
      "AWS Account" = "DioAWS"
    }
  }
}

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
