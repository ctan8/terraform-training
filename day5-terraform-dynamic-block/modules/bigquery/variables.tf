variable "project_id" {
  description = "The GCP project ID"
  default     = "dna-tfm-trn-2475"
}

variable "region" {
  description = "The GCP region"
  default     = "europe-west2"
}

variable "bigquery_dataset_id" {
  description = "Name of the BigQuery dataset"
  default     = "calvyn_terraform_dataset"
}

variable "bigquery_table_id" {
  description = "Name of the BigQuery table"
  default     = "calvyn_terraform_table"
}

variable "bq_dataset_access" {
  type = list(object({
    role          = string
    user_by_email = string
  }))
  description = "BQ datasets access"
}
