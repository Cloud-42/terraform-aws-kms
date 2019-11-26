variable "create" {
  description = "Create the key or not?"
  default     = true 
}
variable "description" {
  type        = string
  description = "Description"
}
variable "alias_name" {
  type        = string
  description = "Alias Name"
}
variable "deletion_window_in_days" {
  description = "Duration in days after which the key is permenently deleted"
  default     = "21"
}
variable "enable_key_rotation" {
  type        = bool
  description = "Whether or not automated key rotation is enabled"
  default     = true
}
variable "policy" {
  description = "JSON document defining KMS policy, must be valid"
  default     = ""
}

variable "tags" {
  type        = map(string)
  description = "Mapping of additional tags"
  default     = {}
}
