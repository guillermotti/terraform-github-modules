# Front team members
module "kaskol10" {
  source   = "../modules/users"
  username = "kaskol10"
  teams    = { (data.github_team.front.id) = "member" }
}

