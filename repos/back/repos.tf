module "back-java-service" {
  source       = "../../modules/repos"
  name         = "back-java-service"
  description  = "The coolest back repository"
  visibility   = "public"
  teams        = { "back" = "maintain" }
}
