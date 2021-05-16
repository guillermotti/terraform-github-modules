variable "username" {
  type        = string
  description = "GitHub username"
}

variable "teams" {
  type        = map(any)
  description = "Team list the user is part of"
  default     = {}
}
