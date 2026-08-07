variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP Region"
  type        = string
  default     = "asia-southeast2"
}

variable "cluster_name" {
  description = "Nama cluster GKE"
  type        = string
  default     = "learning-gke-cluster"
}

variable "node_count" {
  description = "Jumlah node awal"
  type        = number
  default     = 1
}

variable "min_node_count" {
  type    = number
  default = 1
}

variable "max_node_count" {
  type    = number
  default = 2
}

variable "machine_type" {
  type    = string
  default = "e2-medium"
}


# ============================
# sql cloud
# ============================
variable "instance_name" {
  type = string
}

variable "tier" {
  type = string
}

variable "database_name" {
  type = string
}

variable "username" {
  type = string
}

variable "password" {
  type      = string
  sensitive = true
}
