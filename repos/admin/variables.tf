variable "github_token" {
  type        = string
  description = "Token for GitHub authentication"
  default     = "GITHUB_TOKEN"
  sensitive   = true
}

variable "github_organization" {
  type        = string
  description = "Name of the organization"
  default     = "ORG_NAME"
}
