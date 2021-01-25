terraform {
  required_providers {
    tfe = {
      version = "~> 0.24.0"
    }
  }

  required_version = ">= 0.14"
}

provider "tfe" {
  token    = "smbW10HswTK2zA.atlasv1.saP40hLKkhvxnUthwcEHa6YngT9ldu7OZXFbGd0SnqdYB0fTHKtYLUMijzxkeyCSSqc"
}

resource "tfe_organization" "primary" {
  name  = "DioTFE"
  email = "cjberger1993@outlook.com"
}