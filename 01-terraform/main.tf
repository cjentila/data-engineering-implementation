terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.6.0"
    }
  }
}

provider "google" {
  credentials = file(var.google_credentials)
  project = var.project_id
  region  = var.project_region
}

resource "google_storage_bucket" "de-side-project-demo-bucket" {
  name          = var.gcs_bucket_name
  location      = var.project_location
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "Delete"
    }
  }

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}

resource "google_bigquery_dataset" "de-side-project-demo-dataset" {
  dataset_id = var.bq_dataset_name
  location = var.project_location
}