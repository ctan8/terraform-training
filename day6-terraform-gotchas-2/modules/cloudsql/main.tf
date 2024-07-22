# Enable private services access and create a private connection for CloudSQL
resource "google_compute_global_address" "private_ip_address" {
  name          = "private-ip-address"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 16
  network       = var.sql_vpc
}

resource "google_service_networking_connection" "private_vpc_connection" {
  network                 = var.sql_vpc
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.private_ip_address.name]
  deletion_policy = "ABANDON"

  # depends_on = [ google_sql_database_instance.sql-instance ]
}

# Create Cloud SQL instance with private IP
resource "google_sql_database_instance" "sql-instance" {
  name                = "${var.name}-sql"
  database_version    = var.database_version
  region              = var.region
  deletion_protection = false

  settings {
    tier = var.sql_tier

    ip_configuration {
      ipv4_enabled    = false
      private_network = var.sql_vpc
    }
  }

  depends_on = [ google_service_networking_connection.private_vpc_connection ]
}

resource "google_sql_user" "users" {
  name     = var.sql_username
  instance = google_sql_database_instance.sql-instance.name
  password = var.sql_password
}