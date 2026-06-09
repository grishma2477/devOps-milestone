resource "google_compute_instance" "jenkins" {
  name         = "jenkins-server-${terraform.workspace}"
  machine_type = local.gcp_instance_type
  zone         = var.gcp_zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }

  metadata = {
    ssh-keys = "${local.gcp_username}:${file("~/.ssh/gcp_key.pub")}"
  }
}


resource "google_compute_firewall" "allow_jenkins" {
  name    = "allow-jenkins"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "443", "8080"]
  }

  source_ranges = ["0.0.0.0/0"]
}