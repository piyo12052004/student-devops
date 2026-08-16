# =========
# vpc outputs
# =========
output "network_name" {
  description = "Name of the VPC network"
  value       = google_compute_network.vpc.name
}

output "network_id" {
  description = "ID of the VPC network"
  value       = google_compute_network.vpc.id
}

# =========
# subnet outputs
# =========

output "private_subnet_id" {
  description = "Private subnet ID"
  value       = google_compute_subnetwork.private.id
}

output "private_subnet_name" {
  description = "Private subnet name"
  value       = google_compute_subnetwork.private.name
}

# =========
# route outputs
# =========
output "router_name" {
  description = "Cloud Router name"
  value       = google_compute_router.main.name
}
