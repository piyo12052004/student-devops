# =========================
# app Service Account
# =========================
resource "google_service_account" "app" {
  account_id   = var.service_account_name
  display_name = var.service_account_display_name
  project      = var.project_id
}

resource "google_project_iam_member" "artifact_reader" {
  project = var.project_id
  role    = "roles/artifactregistry.reader"
  member  = "serviceAccount:${google_service_account.app.email}"
}

# =========================
# Jenkins Service Account
# =========================
resource "google_service_account" "jenkins" {
  account_id   = "jenkins-sa"
  display_name = "Jenkins Service Account"
  project      = var.project_id
}

resource "google_project_iam_member" "artifact_writer" {
  project = var.project_id
  role    = "roles/artifactregistry.writer"

  member = "serviceAccount:${google_service_account.jenkins.email}"
}

resource "google_project_iam_member" "container_developer" {
  project = var.project_id
  role    = "roles/container.developer"

  member = "serviceAccount:${google_service_account.jenkins.email}"
}