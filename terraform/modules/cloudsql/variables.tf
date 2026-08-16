variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP Region"
  type        = string
}

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