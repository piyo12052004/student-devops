resource "google_sql_database_instance" "mysql" {
  name             = var.instance_name
  database_version = "MYSQL_8_0"
  region           = var.region

  deletion_protection = false

  settings {
    tier = var.tier

    disk_size       = 20
    disk_type       = "PD_SSD"
    disk_autoresize = true

    availability_type = "ZONAL"

    backup_configuration {
      enabled = true
    }

    ip_configuration {
      ipv4_enabled = true
    }
  }
}
resource "google_sql_database" "database" {
  name     = var.database_name
  instance = google_sql_database_instance.mysql.name
}

resource "google_sql_user" "laravel" {
  name     = var.username
  password = var.password
  instance = google_sql_database_instance.mysql.name
}