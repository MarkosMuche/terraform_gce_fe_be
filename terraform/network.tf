

# VPC
resource "google_compute_network" "vpc-network-28bk" {
  name                    = "vpc-network-28bk"
  auto_create_subnetworks = false
}

##############################################################33 SUBNETS
resource "google_compute_subnetwork" "subnet-a-p3og" {
  name          = "subnet-a-p3og"
  ip_cidr_range = "10.10.10.0/24"
  region        = "us-central1"
  network       = google_compute_network.vpc-network-28bk.id
}

resource "google_compute_subnetwork" "subnet-b-z59z" {
  name          = "subnet-b-z59z"
  ip_cidr_range = "10.10.20.0/24"
  region        = "us-east1"
  network       = google_compute_network.vpc-network-28bk.id
}


######################################################################## firewalls

resource "google_compute_firewall" "tkat-firewall-ssh" {
  name     = "tkat-firewall-ssh"
  network  = google_compute_network.vpc-network-28bk.id
  priority = 65535
  #   direction = INGRESS

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/24"]
}


resource "google_compute_firewall" "vbox-firewall-rdp" {
  name     = "vbox-firewall-rdp"
  network  = google_compute_network.vpc-network-28bk.id
  priority = 65535
  #   direction = INGRESS

  allow {
    protocol = "tcp"
    ports    = ["3389"]
  }

  source_ranges = ["0.0.0.0/24"]

}


resource "google_compute_firewall" "cobc-firewall-icmp" {
  name     = "cobc-firewall-icmp"
  network  = google_compute_network.vpc-network-28bk.id
  priority = 65535
  #   direction = INGRESS

  allow {
    protocol = "icmp"
  }

  source_ranges = ["0.0.0.0/24"]

}
