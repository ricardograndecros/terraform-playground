terraform {
  cloud {
    organization = "terraform-tutorial-org-rgc"
    workspaces {
      name = "learn-tfc-gcp-vcs"
    }
  }

  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

provider "google" {
  project = var.GCP_PROJECT_ID
  region = var.GOOGLE_DEFAULT_REGION
  zone = var.GOOGLE_DEFAULT_ZONE
  credentials = var.GOOGLE_CREDENTIALS
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "e2-micro"
  tags = [ "playground", "test", "vcs-test-4" ]

  boot_disk {
    initialize_params {
      image = "cos-cloud/cos-stable"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.name
    access_config {
    }
  }
}