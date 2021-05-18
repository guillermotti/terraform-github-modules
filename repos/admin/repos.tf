module "admin-terraform-github" {
  source      = "../../modules/repos"
  name        = "admin-terraform-github"
  description = "Terraform repository to manage the GitHub organization"
  visibility  = "private"
  teams       = { "admins" = "maintain" }
}
