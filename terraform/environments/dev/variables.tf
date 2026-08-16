# =====================
# variable core
# =====================
variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP Region"
  type        = string
}

variable "zone" {
  description = "GCP Zone"
  type        = string
}

variable "project_name" {
  description = "Project name"
  type        = string
}

# =====================
# variable vpc
# =====================
variable "network_name" {
  description = "Name of the VPC network for dev environment"
  type        = string
}

# =====================
# variable subnet
# =====================
variable "private_subnet_cidr" {
  description = "Private subnet CIDR"
  type        = string
}

variable "pods_cidr" {
  description = "GKE Pods CIDR"
  type        = string
}

variable "services_cidr" {
  description = "GKE Services CIDR"
  type        = string
}


# =====================
# sql cloude subnet
# =====================
variable "database_name" {
  description = "PostgreSQL database name"
  type        = string
}

variable "database_user" {
  description = "PostgreSQL username"
  type        = string
}

variable "database_password" {
  description = "PostgreSQL password"
  type        = string
  sensitive   = true
}