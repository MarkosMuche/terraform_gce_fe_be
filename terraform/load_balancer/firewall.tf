
resource "google_compute_firewall" "fw-allow-health-checks" {
  name    = "fw-allow-health-checks"
  network = "default"
  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
  target_tags   = ["allow-health-checks"]
  source_ranges = ["130.211.0.0/22", "35.191.0.0/16"]

}