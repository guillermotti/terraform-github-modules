terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "4.9.4"
    }
  }
}

resource "github_repository" "this" {
  name                   = var.name
  description            = var.description
  visibility             = var.visibility
  has_downloads          = var.has_downloads
  has_issues             = var.has_issues
  has_projects           = var.has_projects
  has_wiki               = var.has_wiki
  topics                 = var.topics
  delete_branch_on_merge = var.delete_branch_on_merge
  homepage_url           = var.homepage_url
  is_template            = var.is_template
  allow_merge_commit     = var.allow_merge_commit
  allow_squash_merge     = var.allow_squash_merge
  allow_rebase_merge     = var.allow_rebase_merge
  archived               = var.archived
  vulnerability_alerts   = var.vulnerability_alerts
  auto_init              = var.auto_init

  dynamic "pages" {
    for_each = length(keys(var.pages)) == 0 ? [] : [var.pages]

    content {
      source {
        branch = lookup(pages.value.source, "branch", "main")
        path   = lookup(pages.value.source, "path", "/")
      }
      cname = lookup(pages.value, "cname", null)
    }
  }
}

resource "github_team_repository" "some_team_repo" {
  for_each   = var.teams
  team_id    = each.key
  repository = github_repository.this.name
  permission = each.value
}

resource "github_branch_protection" "some_branch_protection" {
  for_each       = var.branches
  pattern        = each.key
  repository_id  = github_repository.this.name
  enforce_admins = lookup(each.value, "enforce_admins", true)

  required_status_checks {
    strict   = lookup(each.value, "strict", true)
    contexts = lookup(each.value, "contexts", [])
  }

  required_pull_request_reviews {
    dismiss_stale_reviews           = lookup(each.value, "dismiss_stale_reviews", true)
    dismissal_restrictions          = concat(lookup(each.value, "dismissal_users", []), lookup(each.value, "dismissal_teams", []))
    require_code_owner_reviews      = lookup(each.value, "require_code_owner_reviews", true)
    required_approving_review_count = lookup(each.value, "required_approving_review_count", 1)
  }

  push_restrictions = lookup(each.value, "push_restrictions", [])
}

resource "github_issue_label" "some_issue_label" {
  for_each    = var.issue_labels
  repository  = github_repository.this.name
  name        = each.key
  color       = lookup(each.value, "color", "FF0000")
  description = lookup(each.value, "description", "")
}

resource "github_repository_collaborator" "a_repo_collaborator" {
  for_each   = var.external_collaborators
  repository = github_repository.this.name
  username   = each.key
  permission = each.value
}
