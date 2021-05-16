# Configure the GitHub Provider
provider "github" {
  token = var.github_token
  owner = var.github_organization
}

terraform {
  required_version = "0.15.3"

  backend "gcs" {
    bucket = "terraform-github-test-tf"
    prefix = "teams"
  }

  required_providers {
    github = {
      source  = "integrations/github"
      version = "4.9.2"
    }
  }
}
