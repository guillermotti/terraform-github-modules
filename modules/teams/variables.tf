variable "name" {
  type        = string
  description = "Team name"
}

variable "description" {
  type        = string
  description = "Brief team description"
}

variable "privacy" {
  type        = string
  description = "The level of privacy for the team"
  default     = "closed"
  validation {
    condition     = var.privacy == "closed" || var.privacy == "secret"
    error_message = "The privacy value must be 'closed' or 'secret'."
  }
}