output "instance_name" {
  value = google_compute_instance.default.name
}

output "instance_zone" {
  value = google_compute_instance.default.zone
}
