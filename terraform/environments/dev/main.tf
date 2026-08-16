module "network" {
  source = "../../modules/network"

  project_name = var.project_name
  project_id   = var.project_id
  region       = var.region

  network_name = var.network_name

  private_subnet_cidr = var.private_subnet_cidr
  pods_cidr           = var.pods_cidr
  services_cidr       = var.services_cidr
}

module "artifact_registry" {
  source = "../../modules/artifact-registry"

  project_id    = var.project_id
  region        = var.region
  repository_id = "laravel-dev"
}

module "cloudsql" {
  source = "../../modules/cloudsql"

  project_id        = var.project_id
  region            = var.region
  database_name     = var.database_name
  database_user     = var.database_user
  database_password = var.database_password
  network_id        = module.network.network_id

  depends_on = [
    module.network
  ]
}

module "iam" {
  source = "../../modules/iam"

  project_id = var.project_id

  service_account_name         = "dev-laravel-sa"
  service_account_display_name = "Dev Laravel Service Account"
}

module "gke" {
  source = "../../modules/gke"

  project_id           = var.project_id
  cluster_name         = "dev-gke"
  region               = var.region
  zone                 = var.zone
  network_name         = module.network.network_name
  subnetwork_name      = module.network.private_subnet_name
  node_service_account = module.iam.service_account_email
}


module "jenkins" {
  source = "../../modules/jenkins"

  project_id   = var.project_id
  project_name = var.project_name
  zone         = var.zone

  machine_type = "e2-medium"

  subnetwork_id = module.network.private_subnet_id

  service_account_email = module.iam.jenkins_service_account_email

  depends_on = [
    module.network
  ]
}