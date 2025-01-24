variable "google_credentials_file" {
  type        = string
  description = "Path to the Google Cloud service account credentials file."
}

variable "google_project" {
  type        = string
  description = "The Google Cloud project ID."
}

variable "google_zone" {
  type        = string
  description = "The region where the GKE cluster will be deployed."
}