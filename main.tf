terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "7.39.0"
    }
  }
}

provider "google" {
  project = "project-56b2f5d2-7168-44bb-ab5"
  region  = "asia-southeast2"
}

data "google_compute_image" "my_image" {
  family  = "debian-11"
  project = "debian-cloud"
}

resource "google_service_account" "my_service_account" {
  account_id   = "mantap-sh"
  display_name = "Mantap SA"
}

# vm 1
resource "google_compute_instance" "test" {
  name                      = "test"
  machine_type              = "e2-medium"
  zone                      = "asia-southeast2-a"
  allow_stopping_for_update = true

  lifecycle {
    prevent_destroy = false
  }

  boot_disk {
    initialize_params {
      image = data.google_compute_image.my_image.self_link
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }

  #   metadata_startup_script = "echo hi > /test.txt"

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.my_service_account.email
    scopes = ["cloud-platform"]
  }
}

# vm 2
resource "google_compute_instance" "test-2" {
  name                      = "test-2"
  machine_type              = "e2-medium"
  zone                      = "asia-southeast2-a"
  allow_stopping_for_update = true

  lifecycle {
    prevent_destroy = false
  }
  boot_disk {
    initialize_params {
      image = data.google_compute_image.my_image.self_link
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }

  #   metadata_startup_script = "echo hi > /test.txt"

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.my_service_account.email
    scopes = ["cloud-platform"]
  }
}
