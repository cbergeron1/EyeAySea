#####################
# Locals Definition #
#####################

# locals {
#   name = value
# }

###################
# TF Variable Map #
###################

variable "sensitive_vars" {
  type        = map(string)
  description = "description"

  default = {
    Email       = "NULL"
    oAuth_Token = "NULL"
    TFE_Token   = "NULL"
  }
}
