output "instance_name" {
  description = "Jenkins VM name"
  value       = google_compute_instance.jenkins.name
}

output "instance_id" {
  description = "Jenkins VM ID"
  value       = google_compute_instance.jenkins.id
}

output "internal_ip" {
  description = "Jenkins VM internal IP"
  value       = google_compute_instance.jenkins.network_interface[0].network_ip
}