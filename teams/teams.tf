module "front" {
  source      = "../modules/teams"
  name        = "front"
  description = "Front Team"
}

module "back" {
  source      = "../modules/teams"
  name        = "back"
  description = "Back Team"
}

module "admins" {
  source      = "../modules/teams"
  name        = "admins"
  description = "Admin Team"
}

module "everyone" {
  source      = "../modules/teams"
  name        = "everyone"
  description = "Everyone is here"
}