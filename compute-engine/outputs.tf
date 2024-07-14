output "instance_name" {
  value = google_compute_instance.default.name
}

output "instance_zone" {
  value = google_compute_instance.default.zone
}

output "instance_ip" {
  value = google_compute_instance.default.network_interface[0].access_config[0].nat_ip
}

output "vpc_name" {
  value = google_compute_network.vpc_network.name
}

output "subnet_name" {
  value = google_compute_subnetwork.subnetwork.name
}

output "subnet_ip" {
  value = google_compute_subnetwork.subnetwork.ip_cidr_range
}
