variable "project_id" {
  description = "The GCP project ID"
  default     = "gcp-sandbox-334609"
}

variable "region" {
  description = "The GCP region"
  default     = "europe-west2"
}

variable "zone" {
  description = "The GCP zone"
  default     = "europe-west2-a"
}

variable "instance_name" {
  description = "Name of the VM instance"
  default     = "calvyn-terraform-vm"
}

variable "machine_type" {
  description = "Type of the VM instance"
  default     = "e2-small"
}

variable "vpc_name" {
  description = "Name of the VPC"
  default     = "calvyn-terraform-vpc"
}

variable "subnet_name" {
  description = "Name of the subnet"
  default     = "calvyn-terraform-subnet"
}

variable "subnet_ip" {
  description = "IP range of the subnet"
  default     = "10.0.0.0/24"
}
