module "network" {
  source = "../../modules/network"

  network_name = var.network_name
  project_id   = var.project_id
  region       = var.region
}