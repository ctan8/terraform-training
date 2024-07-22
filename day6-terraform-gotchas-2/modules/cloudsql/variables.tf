variable "name" {
  description = "Name of SQL"
}

variable "database_version" {
  description = "Database version"
}

variable "region" {
  description = "region of SQL"
}

variable "sql_tier" {
  description = "SQL tier"
}

variable "sql_username" {
  description = "SQL username"
  sensitive   = true
}

variable "sql_password" {
  description = "SQL password"
  sensitive   = true
}

variable "sql_vpc" {
  description = "The VPC where SQL will be deployed"

}