variable "name" {
  description = "Name of the VPC and Subnet"
}

variable "zone" {
  description = "The GCP zone"
}

variable "project_id" {
  description = "The GCP project ID"
}

variable "subnet_ip" {
  description = "IP range of the subnet"
}

variable "region" {
  description = "The GCP region"
}

variable "machine_type" {
  description = "Type of the VM instance"
}

variable "image_type" {
  description = "Image type of the VM instance"
}

variable "vm_username" {
  description = "The username of the VM"
  sensitive = true
}

variable "vm_password" {
  description = "The password of the VM"
  sensitive = true
}

# variable "database_version" {
#   description = "SQL database version"
# }

# variable "sql_tier" {
#   description = "SQL tier"
# }

# variable "sql_username" {
#   description = "SQL username"
# }

# variable "sql_password" {
#   description = "SQL password"
#   sensitive   = true
# }