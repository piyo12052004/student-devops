output "cluster_name" {
  value = google_container_cluster.primary.name
}

output "cluster_location" {
  value = google_container_cluster.primary.location
}

output "cluster_endpoint" {
  value     = google_container_cluster.primary.endpoint
  sensitive = true
}

output "vpc_name" {
  value = google_compute_network.vpc.name
}

output "subnet_name" {
  value = google_compute_subnetwork.subnet.name
}

output "get_credentials_command" {
  value = "gcloud container clusters get-credentials ${google_container_cluster.primary.name} --region ${var.region} --project ${var.project_id}"
}


# ============================
# sql cloud
# ============================
output "cloud_sql_public_ip" {
  value = google_sql_database_instance.mysql.public_ip_address
}

output "database_name" {
  value = google_sql_database.database.name
}

output "database_username" {
  value = google_sql_user.laravel.name
}