terraform {
  required_version = ">= 1.6.6"
}

provider "google" {
  #   credentials = file("<path-to-your-service-account-json-key>")
  project = var.project_id
  region  = var.region
}
