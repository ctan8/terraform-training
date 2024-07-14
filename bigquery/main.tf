# Create BQ dataset
resource "google_bigquery_dataset" "default" {
  dataset_id = var.bigquery_dataset_id
  location   = var.region
  project    = var.project_id
}

# Create BQ table
resource "google_bigquery_table" "default" {
  table_id  = var.bigquery_table_id
  dataset_id = google_bigquery_dataset.default.dataset_id
  project   = var.project_id
  deletion_protection = false

  schema = <<EOF
[
  {
    "name": "id",
    "type": "STRING",
    "mode": "REQUIRED"
  },
  {
    "name": "name",
    "type": "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "age",
    "type": "INTEGER",
    "mode": "NULLABLE"
  }
]
EOF
}
