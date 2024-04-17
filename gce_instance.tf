resource "google_compute_instance" "backend" {
  name         = "backend"
  machine_type = "e2-standard-2"
  zone         = var.zone
   boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
      labels = {
      }
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
}


resource "google_compute_instance" "frontend" {
  name         = "frontend"
  machine_type = "e2-standard-2"
  zone         = var.zone
  tags = ["frontend"]
   boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
      labels = {
      }
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
}
