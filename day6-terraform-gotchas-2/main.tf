resource "random_string" "db_password" {
  length  = 16
  special = true
}

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
  vm_username  = var.vm_username
  vm_password = var.vm_password
}

# # 1. use TF_VAR environment variable for SQL username and SQL password
# module "sql-instance" {
#   source = "./modules/cloudsql"

#   name             = var.name
#   database_version = var.database_version
#   region           = var.region
#   sql_tier         = var.sql_tier
#   sql_username     = var.sql_username
#   sql_password = var.sql_password
#   sql_vpc      = module.network.vpc_name

#   depends_on = [ module.network ]
# }

# 2. Use random_password resource for SQL password but keep TF_VAR environment variable for SQL username
# module "sql-instance" {
#   source = "./modules/cloudsql"

#   name             = var.name
#   database_version = var.database_version
#   region           = var.region
#   sql_tier         = var.sql_tier
#   sql_username     = var.sql_username
#   sql_password     = random_string.db_password.id
#   sql_vpc          = module.network.vpc_name

#   depends_on = [ module.network ]
# }