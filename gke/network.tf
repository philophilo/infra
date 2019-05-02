resource "google_compute_network" "infra_network" {
    name                    = "infra-${var.environment}-vpc"
    auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "infra_subnet" {
    name                        = "infra-${var.environment}-subnet"
    ip_cidr_range               = "192.168.0.0/16"
    region                      = "${var.region}"
    network                     = "${google_compute_network.infra_network.self_link}"
    private_ip_google_access    = "true"
}
