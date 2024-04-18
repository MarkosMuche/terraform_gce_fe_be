resource "google_compute_instance" "backend" {
  name         = "backend"
  machine_type = "e2-standard-2"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image  = "debian-cloud/debian-12"
      labels = {}
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }

  metadata = {
    startup-script-url = "https://storage.googleapis.com/fancy-store-${var.project_id}/startup-script.sh"
  }

  service_account {
    email  = "clearml@icardio-ai-393417.iam.gserviceaccount.com"
    scopes = ["https://www.googleapis.com/auth/cloud-platform"] # granting full access to all Google Cloud services
  }
}

resource "google_compute_instance" "frontend" {
  name         = "frontend"
  machine_type = "e2-standard-2"
  zone         = var.zone
  tags         = ["frontend"]

  boot_disk {
    initialize_params {
      image  = "debian-cloud/debian-12"
      labels = {}
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }

  metadata = {
    startup-script-url = "https://storage.googleapis.com/fancy-store-${var.project_id}/startup-script.sh"
  }

  service_account {
    email  = "clearml@icardio-ai-393417.iam.gserviceaccount.com"
    scopes = ["https://www.googleapis.com/auth/cloud-platform"] # granting full access to all Google Cloud services
  }
}
