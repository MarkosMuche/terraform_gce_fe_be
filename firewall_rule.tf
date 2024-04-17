resource "google_compute_firewall" "fw-fe" {
  name    = "fw-fe"
  network = "default"


  allow {
    protocol = "tcp"
    ports    = ["8080"]
  }

  source_tags = ["frontend"]
}


resource "google_compute_firewall" "fw-be" {
  name    = "fw-be"
  network = "default"


  allow {
    protocol = "tcp"
    ports    = ["8081-8082"]
  }

  source_tags = ["backend"]
}

