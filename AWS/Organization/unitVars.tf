variable "organizations_policies" {
  type        = list(map(string))
  description = "List of Github Repository Names/Descriptions/GitIgnore Template."

  default = []
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
