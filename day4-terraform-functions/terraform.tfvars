project_id   = "dna-tfm-trn-2475"
region       = "europe-west2"
zone         = ["europe-west2-a", "europe-west2-b", "europe-west2-c"]
name         = "calvyn-terraform"
vm_name      = "calvyn-terraform-vm"
machine_type = "e2-small"
subnet_ip    = "10.0.0.0/24"
image_type   = "debian-cloud/debian-12"
labels = {
  "environment" = "dev"
  "team"        = "operations"
}
enable_monitoring = "yes"