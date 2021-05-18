module "front-javascript-ui" {
  source      = "../../modules/repos"
  name        = "front-javascript-ui"
  description = "The coolest front repository"
  visibility  = "public"
  teams       = { "front" = "maintain" }
  branches = {
    "main" = {
      enforce_admins                  = false,
      require_code_owner_reviews      = true,
      required_approving_review_count = 2,
      required_status_checks          = { strict = false }
    }
  }
  allow_merge_commit     = true
  allow_squash_merge     = true
  allow_rebase_merge     = true
  delete_branch_on_merge = true
  vulnerability_alerts   = true
}
