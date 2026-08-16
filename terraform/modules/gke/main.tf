resource "google_container_cluster" "dev" {
  name     = var.cluster_name
  location = var.zone

  network    = var.network_name
  subnetwork = var.subnetwork_name

  deletion_protection = false

  remove_default_node_pool = true
  initial_node_count       = 1

  ip_allocation_policy {
    cluster_secondary_range_name  = "pods"
    services_secondary_range_name = "services"
  }
  
}

resource "google_container_node_pool" "dev" {
  name       = "${var.cluster_name}-node-pool"
  location   = var.zone
  cluster    = google_container_cluster.dev.name
  node_count = 2

  node_config {
    machine_type = "e2-medium"

    disk_size_gb = 20
    disk_type    = "pd-standard"

    service_account = var.node_service_account

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }

  autoscaling {
    min_node_count = 1
    max_node_count = 3
  }
}