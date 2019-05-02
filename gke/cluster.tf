resource "google_container_cluster" "infra_cluster" {
    name                = "infra-${var.environment}"
    zone                = "${var.zone}"
    network             = "${google_compute_network.infra_network.self_link}"
    subnetwork          = "${google_compute_subnetwork.infra_subnet.self_link}"
    node_pool           = [{
        name            = "default-pool"
        node_count      = 2

        autoscaling {
            min_node_count      = 2
            max_node_count      = 5
        }

        management {
            auto_upgrade        = true
        }
    }]
}
