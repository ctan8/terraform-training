# project_id   = "dna-tfm-trn-2475"
project_id          = "gcp-sandbox-334609"
region              = "europe-west2"
bigquery_dataset_id = "calvyn_terraform_bq_datasets"
bigquery_table_id   = "calvyn_terraform_bq_table"
bq_dataset_access = [
  {
    role          = "OWNER"
    user_by_email = " "
  },
  {
    role          = "READER"
    user_by_email = " "
}]