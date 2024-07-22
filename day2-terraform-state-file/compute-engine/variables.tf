variable "project_id" {
  description = "The GCP project ID"
}

variable "region" {
  description = "The GCP region"
}

variable "zone" {
  description = "The GCP zone"
}

variable "instance_name" {
  description = "Name of the VM instance"
}

variable "machine_type" {
  description = "Type of the VM instance"
}

variable "image_type" {
  description = "Image type of the VM instance"
}

variable "vpc_name" {
  description = "Name of the VPC"
}

variable "subnet_name" {
  description = "Name of the subnet"
}

variable "subnet_ip" {
  description = "IP range of the subnet"
}
