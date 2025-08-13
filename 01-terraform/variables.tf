variable "google_credentials" {
    description = "Project ID"
    default = "~/.gc/service-account.json"
}

variable "project_id" {
    description = "Project ID"
    default = "data-engineering-side-project"
}

variable "project_region" {
    description = "Project Region"
    default = "us-central1"
}

variable "project_location" {
    description = "Project Location"
    default = "US"
}

variable "bq_dataset_name" {
    description = "My Dataset Name"
    default = "de_side_project_demo_dataset"
}

variable "gcs_bucket_name" {
    description = "My Bucket Name"
    default = "de-side-project-demo-bucket"
}

variable "gcs_storage_class" {
    description = "Bucket Storage Class"
    default = "STANDARD"
}