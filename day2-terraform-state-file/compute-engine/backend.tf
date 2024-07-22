terraform {
  backend "gcs" {
    bucket = "ctan-terraform-state" # change to your bucket name
    prefix = "terraform/compute-engine" # change to whichever prefix you want
  }
}
