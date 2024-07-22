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

  metadata_startup_script = <<-EOT
    #!/bin/bash
    # Create a new user with a password
    useradd -m -s /bin/bash ${var.vm_username}
    echo "${var.vm_username}:${var.vm_password}" | chpasswd
  EOT
}
