output "service_account_email" {
  description = "Service Account email"
  value       = google_service_account.app.email
}

output "service_account_name" {
  description = "Service Account resource name"
  value       = google_service_account.app.name
}

output "jenkins_service_account_email" {
  description = "Jenkins Service Account email"
  value       = google_service_account.jenkins.email
}

output "jenkins_service_account_name" {
  description = "Jenkins Service Account resource name"
  value       = google_service_account.jenkins.name
}