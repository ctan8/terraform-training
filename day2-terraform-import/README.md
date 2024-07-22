# day2-terraform-state-file

## 1. Configure remote backend
1. You will first need to create a gcs bucket as your remote backend using `gcloud` -  Example `gcloud storage buckets create gs://calvyn-terraform-state --location=EU`

2. Then you will want to create a `backend.tf` to put your remote backend configuration

    ```
    terraform {
    backend "gcs" {
    bucket = "<your-bucket-name>"
    prefix = "terraform/compute-engine"
        }
    }

3. Run `terraform init` and all the other terraform commands