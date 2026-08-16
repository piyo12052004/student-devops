resource "google_artifact_registry_repository" "docker" {
  location      = var.region
  repository_id = var.repository_id
  description   = "Docker repository for Laravel development"
  format        = "DOCKER"

  project = var.project_id
}