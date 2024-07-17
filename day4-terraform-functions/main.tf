module "network" {
  source = "./modules/network"

  name      = var.name
  region    = var.region
  subnet_ip = var.subnet_ip
}

module "vm-instance" {
  source = "./modules/compute-engine"

  count             = 3
  name              = "${var.vm_name}-${count.index}"
  vpc_name          = module.network.vpc_name
  subnet_name       = module.network.subnet_name
  zone              = element(var.zone, count.index % length(var.zone))
  machine_type      = var.machine_type
  image_type        = var.image_type
  labels            = var.labels
  enable_monitoring = var.enable_monitoring

}