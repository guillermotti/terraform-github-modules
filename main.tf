provider "google" {
  region = "europe-west1"
}

terraform {
  required_version = "0.15.3"

  backend "gcs" {
    bucket = "github-de041bbb3c8f6f67"
    prefix = "infra"
  }

  required_providers {
    google = {
      source  = "google"
      version = "3.67.0"
    }
  }
}

resource "random_id" "id" {
  byte_length = 8
}

resource "google_project" "github" {
  name            = "github"
  project_id      = "github-${random_id.id.hex}"
  billing_account = var.billing_account
}

resource "google_storage_bucket" "github" {
  project       = google_project.github.project_id
  name          = "github-${random_id.id.hex}"
  force_destroy = true
}

output "state_bucket" {
  value = google_storage_bucket.github.name
}
