terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "4.9.2"
    }
  }
}

resource "github_membership" "this" {
  username = var.username
  role     = "admin"
}

resource "github_team_membership" "some_team_membership" {
  for_each = var.teams
  team_id  = each.key
  username = github_membership.this.username
  role     = each.value
}

// Add user to "everyone" group by default
data "github_team" "everyone" {
  slug = "everyone"
}

resource "github_team_membership" "everyone" {
  team_id  = data.github_team.everyone.id
  username = github_membership.this.username
  role     = "maintainer"
}
