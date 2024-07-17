# Create compute engine
resource "google_compute_instance" "default" {
  name         = "${var.name}-vm"
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.image_type
    }
  }

  network_interface {
    network    = var.vpc_name
    subnetwork = var.subnet_name
  }

  labels = var.labels

  metadata = {
    enable-oslogin = var.enable_monitoring == "yes" ? "TRUE" : "FALSE"
  }
}
