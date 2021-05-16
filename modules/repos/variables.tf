variable "name" {
  type        = string
  description = "The name of the repository"
}

variable "description" {
  type        = string
  description = "A description of the repository"
}

variable "homepage_url" {
  type        = string
  description = "URL of a page describing the project"
  default     = ""
}

variable "visibility" {
  type        = string
  description = "Can be 'public' or 'private'. If your organization is associated with an enterprise account using GitHub Enterprise Cloud or GitHub Enterprise Server 2.20+, visibility can also be 'internal'"
  default     = "private"
}

variable "has_issues" {
  type        = bool
  description = "Set to 'true' to enable the GitHub Issues features on the repository"
  default     = true
}

variable "has_projects" {
  type        = bool
  description = "Set to 'true' to enable the GitHub Projects features on the repository"
  default     = true
}

variable "has_wiki" {
  type        = bool
  description = "Set to 'true' to enable the GitHub Wiki features on the repository"
  default     = true
}

variable "is_template" {
  type        = bool
  description = "Set to 'true' to tell GitHub that this is a template repository"
  default     = false
}

variable "allow_merge_commit" {
  type        = bool
  description = "Set to 'false' to disable merge commits on the repository"
  default     = true
}

variable "allow_squash_merge" {
  type        = bool
  description = "Set to 'false' to disable squash merges on the repository"
  default     = true
}

variable "allow_rebase_merge" {
  type        = bool
  description = "Set to 'false' to disable rebase merges on the repository"
  default     = true
}

variable "delete_branch_on_merge" {
  type        = bool
  description = "Automatically delete head branch after a pull request is merged. Defaults to 'false'"
  default     = false
}

variable "has_downloads" {
  type        = bool
  description = "Set to 'true' to enable the (deprecated) downloads features on the repository"
  default     = false
}

variable "auto_init" {
  type        = bool
  description = "Set to 'true' to produce an initial commit in the repository"
  default     = true
}

variable "archived" {
  type        = bool
  description = "Specifies if the repository should be archived. Defaults to 'false'. NOTE Currently, the API does not support unarchiving"
  default     = false
}

variable "pages" {
  type        = any
  description = "The repository's GitHub Pages configuration"
  default     = {}
}

variable "topics" {
  type        = list(string)
  description = "The list of topics of the repository"
  default     = []
}

variable "vulnerability_alerts" {
  type        = bool
  description = "Set to 'true' to enable security alerts for vulnerable dependencies"
  default     = true
}

variable "teams" {
  type        = map(any)
  description = "The list of teams and permissions for each team of the repository"
  default     = {}
}

variable "branches" {
  type        = map(any)
  description = "The list of branch protection rules of the repository"
  default     = {}
}

variable "issue_labels" {
  type        = map(any)
  description = "The list of issue labels of the repository"
  default     = {}
}

variable "external_collaborators" {
  type        = map(string)
  description = "External collaborators map. Example {'user'='push'}"
  default     = {}
}
