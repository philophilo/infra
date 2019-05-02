provider "google" {
    credentials         = "${file(var.credentials)}"
    project             = "${var.project}"
    region              = "${var.region}"
    zone                = "${var.zone}"
}

terraform {
    backend "gcs" {}
}

data "terraform_remote_state" "infra" {
    backend = "gcs"

    config {
        bucket          = "${var.bucket}"
        prefix          = "${var.prefix}"
        project         = "${var.project}"
        credentials     = "${file(var.credentials)}"
    }
}
