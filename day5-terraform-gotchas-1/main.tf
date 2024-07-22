module "network" {
  source = "./modules/network"

  name      = var.name
  region    = var.region
  subnet_ip = var.subnet_ip
}

module "vm-instance" {
  source = "./modules/compute-engine"

  name         = var.name
  vpc_name     = module.network.vpc_name
  subnet_name  = module.network.subnet_name
  zone         = var.zone
  machine_type = var.machine_type
  image_type   = var.image_type
}