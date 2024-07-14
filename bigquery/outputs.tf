output "bigquery_dataset_id" {
  value = google_bigquery_dataset.default.dataset_id
}

output "bigquery_table_id" {
  value = google_bigquery_table.default.table_id
}
