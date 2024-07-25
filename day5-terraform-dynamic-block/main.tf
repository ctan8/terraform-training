module "bigquery" {
  source = "./modules/bigquery"

  bigquery_dataset_id = "${var.name}-bq-dataset"
  region              = var.region
  project_id          = var.project_id
  bigquery_table_id   = "${var.name}-bq-table"
}