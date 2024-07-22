import {
    to = google_compute_network.calvyn_vpc_network
    id = "calvyn-vpc"
}

resource "google_compute_network" "calvyn_vpc_network" {
# will be filled in through terraform import
    name = "calvyn-vpc"
}