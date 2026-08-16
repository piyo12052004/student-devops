variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "project_name" {
  description = "Project name used for resource naming"
  type        = string
}

variable "zone" {
  description = "GCP zone"
  type        = string
}

variable "machine_type" {
  description = "Machine type for Jenkins VM"
  type        = string
  default     = "e2-medium"
}

variable "subnetwork_id" {
  description = "Private subnet ID for Jenkins VM"
  type        = string
}

variable "service_account_email" {
  description = "Service account email used by Jenkins VM"
  type        = string
}