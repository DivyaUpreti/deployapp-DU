provider "google" {
<<<<<<< HEAD
  credentials = jsondecode(var.google_credentials_file)
=======
  credentials = file(var.google_credentials_file)
>>>>>>> parent of 9a0b78c (modified terraform main file)
  project     = var.google_project
  zone        = var.google_zone
}
resource "google_container_cluster" "primary" {
  name     = "hello-world-cluster"
  location = var.google_zone
  initial_node_count = 1
  node_config {
    machine_type = "n1-standard-1"
    disk_size_gb = 10
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
    service_account = "demo-507@amiable-reducer-448110-n3.iam.gserviceaccount.com"
  }
    deletion_protection = false
}
resource "google_container_node_pool" "primary_nodes" {
  name       = "primary-node-pool"
  cluster    = google_container_cluster.primary.name
  location   = google_container_cluster.primary.location
  node_count = 1
  node_config {
    machine_type = "n1-standard-1"
    disk_size_gb = 10
    preemptible  = true
    service_account = "demo-507@amiable-reducer-448110-n3.iam.gserviceaccount.com"
  }
}

