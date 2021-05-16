terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "4.9.2"
    }
  }
}

resource "github_team" "this" {
  name        = var.name
  description = var.description
  privacy     = var.privacy
}
