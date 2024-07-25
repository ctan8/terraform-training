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