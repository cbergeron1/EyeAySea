// You will need to import this resource if this flag is set to true.
// That import will need to incur before the resource is merged/applied to the state.
// Example Import Command -> `terraform import module.organization.aws_organizations_organization.organization o-1234567`
variable "new_organization" {
  type        = bool
  description = "Is this a new AWS Organizations setup?"

  default = false
}

variable "new_accounts" {
  type        = map(string)
  description = "Map of Name & E-mail to create new accounts under the organization."

  default = null
}

variable "aws_service_access_principals" {
  type        = list(string)
  description = "List of Services to enable integration with. NOT RECOMMENDED TO USE."

  default = null
}

variable "feature_set" {
  type        = string
  description = "value"

  default = "ALL"

  validation {
    condition = contains(["ALL", "CONSOLIDATED_BILLING"], var.feature_set)

    error_message = "Variable \"feature_set\" must be either \"ALL\" or \"CONSOLIDATED_BILLING\"."
  }
}

variable "enabled_policy_types" {
  type        = list(string)
  description = "List of Policy Types to enable. Only works if feature_set is set to \"ALL\"."

  default = [
    "AISERVICES_OPT_OUT_POLICY",
    "SERVICE_CONTROL_POLICY",
    "TAG_POLICY"
  ]
}

variable "iam_user_access_to_billing" {
  type        = string
  description = "Do you want to grant IAM users the ability access billing information."

  default = "DENY"

  validation {
    condition = contains(["ALLOW", "DENY"], var.iam_user_access_to_billing)

    error_message = "Variable \"iam_user_access_to_billing\" must be either \"ALLOW\" or \"DENY\"."
  }
}

variable "role_name" {
  type        = string
  description = "The IAM Role that you want preconfigured in each account."

  default = null
}

variable "tags" {
  type        = map(string)
  description = "Additional tags to apply to this resource set."

  default = null
}
