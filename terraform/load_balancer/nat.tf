

resource "google_compute_router" "nat-router-us1" {
  name    = "nat-router-us1"
  region  = var.region
  network = "default"

  bgp {
    asn = 64514
  }
}

resource "google_compute_router_nat" "nat-config" {
  name                               = "nat-config"
  router                             = google_compute_router.router.name
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }
}