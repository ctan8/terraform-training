# Create VPC
resource "google_compute_network" "vpc_network" {
  name                    = "${var.name}-vpc"
  auto_create_subnetworks = false
}

# Create subnet compute engine
resource "google_compute_subnetwork" "subnetwork" {
  name          = "${var.name}-subnet"
  ip_cidr_range = var.subnet_ip
  region        = var.region
  network       = google_compute_network.vpc_network.name
}