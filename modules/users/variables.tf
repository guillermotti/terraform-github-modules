variable "username" {
  type        = string
  description = "GitHub username"
}

variable "teams" {
  type        = map(any)
  description = "Team list the user is part of"
  default     = {}
}

variable "add_to_everyone_team" {
  type        = bool
  description = "If the user is part of 'everyone' team"
  default     = true
}
