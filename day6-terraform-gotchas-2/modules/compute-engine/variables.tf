variable "zone" {
  description = "The GCP zone"
}

variable "name" {
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
  description = "Name of the Subnet"
}

variable "vm_username" {
  description = "The username of the VM"
  sensitive = true
}

variable "vm_password" {
  description = "The password of the VM"
  sensitive = true
}