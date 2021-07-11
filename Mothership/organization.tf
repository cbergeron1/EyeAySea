#############################
# Managed AWS Organizations #
#############################

resource "aws_organizations_organization" "DioAWS" {
  feature_set = "ALL"

  enabled_policy_types = [
    "AISERVICES_OPT_OUT_POLICY",
    "SERVICE_CONTROL_POLICY",
    "TAG_POLICY"
  ]
}
