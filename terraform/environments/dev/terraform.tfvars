project_id   = "project-56b2f5d2-7168-44bb-ab5"
project_name = "devops-dev"

region = "asia-southeast2"
zone   = "asia-southeast2-a"

# =====================
# name vpc dev
# =====================
network_name = "devops-dev-vpc"

# =====================
# name subnet dev
# =====================
private_subnet_cidr = "10.10.2.0/24"
pods_cidr           = "10.20.0.0/16"
services_cidr       = "10.30.0.0/20"

# =====================
# name sql cloud dev
# =====================
database_name     = "laravel"
database_user     = "laravel"
database_password = "@@10laravel10@@"