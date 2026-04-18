variable "alias" {
  description = "KMS key alias (without the alias/ prefix)"
  type        = string
}

variable "description" {
  description = "Description of the KMS key"
  type        = string
  default     = "CMK managed by Terraform"
}

variable "deletion_window_in_days" {
  description = "Days before key is deleted after destroy (7-30)"
  type        = number
  default     = 7
}

variable "key_policy" {
  description = "JSON key policy — defaults to account root full access if null"
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags to apply to the key"
  type        = map(string)
  default     = {}
}
