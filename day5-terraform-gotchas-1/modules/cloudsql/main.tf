resource "google_sql_database_instance" "sql-instance" {
  name             = "${var.name}-sql"
  database_version = var.database_version
  region           = var.region

  settings {
    tier = var.sql_tier

    ip_configuration {
      ipv4_enabled = true
    }
  }
}

resource "google_sql_user" "users" {
  name     = var.sql_username
  instance = google_sql_database_instance.sql-instance.name
  password = var.sql_password
}