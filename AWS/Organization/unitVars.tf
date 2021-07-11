variable "organizations_policies" {
  type        = list(map(string))
  description = "List of Github Repository Names/Descriptions/GitIgnore Template."

  default = [
    {
      name        = "Tag Enforcement"
      type        = "TAG_POLICY"
      description = "Enforce specific Tags to meet compliance."
      policy_name = "tag_enforcement.json"
    },
    {
      name        = "EC2 Enforcement"
      type        = "SERVICE_CONTROL_POLICY"
      description = "Restrict all accounts to smaller EC2 as I'm a single person not a mega corp."
      policy_name = "ec2_enforcement.json"
    }
  ]
}

variable "organizational_units" {
  type        = list(string)
  description = "List of Organizational Unit Names you want to create."

  default = null
}

variable "parent_id" {
  type        = string
  description = "ID of the Parent Org Unit or the Root Unit."
}
