data "github_team" "front" {
  slug = "front"
}

data "github_team" "back" {
  slug = "back"
}

data "github_team" "admins" {
  slug = "admins"
}

module "guillermotti" {
  source   = "../modules/admins"
  username = "guillermotti"
  teams    = { (data.github_team.admins.id) = "maintainer", (data.github_team.back.id) = "member" }
}

# module "kaskol10" {
#   source   = "../modules/admins"
#   username = "kaskol10"
#   teams    = { (data.github_team.teleport-users.id) = "maintainer" }
# }
