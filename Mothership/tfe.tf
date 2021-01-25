###############################
# Create Primary Organization #
###############################

# Set email as TFE Var and pull it down
resource "tfe_organization" "primary" {
  name  = "DioTFE"
  email = "cjberger1993@outlook.com"
}

