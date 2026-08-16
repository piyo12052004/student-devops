# =========
# core variables
# =========
variable "project_name" {
  description = "Project name used for resource naming"
  type        = string
}

variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
}

# =========
# vpc variables
# =========
variable "network_name" {
  description = "Name of the VPC network"
  type        = string
}

# =========
# subnet variables
# =========
variable "private_subnet_cidr" {
  description = "CIDR range for private subnet"
  type        = string
}

variable "pods_cidr" {
  description = "Secondary CIDR range for GKE Pods"
  type        = string
}

variable "services_cidr" {
  description = "Secondary CIDR range for GKE Services"
  type        = string
}