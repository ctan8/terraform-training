resource "random_password" "db_password" {
  length  = 16
  special = true
}

module "sql-instance" {
  source = "./modules/cloudsql"

  name             = var.name
  database_version = var.database_version
  region           = var.region
  sql_tier         = var.sql_tier
  sql_username     = var.sql_username
  sql_password     = random_password.db_password.id
}