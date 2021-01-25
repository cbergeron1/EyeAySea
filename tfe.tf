terraform {
  required_providers {
    tfe = {
      version = "~> 0.24.0"
    }
  }

  required_version = ">= 0.14"
}

provider "tfe" {
  token    = "jHjQ9RsNb19WSg.atlasv1.s2tO6Impxy3ddKGP8MXDn45hJ8EIOAYONUAkjjSMoOkl8Xx4fyRVMfzLtzp96hCk1a0"
}

resource "tfe_organization" "primary" {
  name  = "DioTFE"
  email = "cjberger1993@outlook.com"
}