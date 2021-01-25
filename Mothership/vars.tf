#####################
# Locals Definition #
#####################

# locals {
#   name = value
# }

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
  description = "description"

  default = {
    Email          = "NULL"
    oAuth_Token_ID = "NULL"
    TFE_Token      = "NULL"
  }
}
