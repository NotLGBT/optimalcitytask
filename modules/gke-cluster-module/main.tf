provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.region
  
  initial_node_count = var.node_count

  network    = var.network
  subnetwork = var.subnetwork

  node_config {
    preemptible  = true 
    machine_type = var.machine_type
    disk_type = "pd-ssd"
    disk_size_gb = 65
    

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    # labels = var.node_labels
    # tags   = var.node_tags
  }
   

  

#   enable_autoscaling = var.enable_autoscaling
#   min_node_count     = var.min_node_count
#   max_node_count     = var.max_node_count

  network_policy {
    enabled = var.enable_network_policy
  }

  private_cluster_config {
    enable_private_nodes = var.enable_private_nodes
    master_ipv4_cidr_block = var.master_ipv4_cidr_block
  }
}
