resource "google_compute_instance" "jenkins" {
  name         = "${var.project_name}-jenkins"
  project      = var.project_id
  zone         = var.zone
  machine_type = var.machine_type

  tags = [
    "jenkins",
    "ssh"
  ]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2404-lts-amd64"
      size  = 30
      type  = "pd-balanced"
    }
  }

  network_interface {
    subnetwork = var.subnetwork_id
     access_config {}
  }

  service_account {
    email  = var.service_account_email
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }
}