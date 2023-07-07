provider "google" {
  project     = var.project
  credentials = file("~/MEGA/cai_dat_ca_nhan/gcp/website-323009-5ac59a49229b.json") // your credentials.json file 
}

#---------------------------------------------------------------
# Creating the VPC
#---------------------------------------------------------------

resource "google_compute_network" "vpc" {
 name                    = var.vpc_name
 auto_create_subnetworks = "false"
}

#---------------------------------------------------------------
# Creating the Subnet
#---------------------------------------------------------------

resource "google_compute_subnetwork" "subnet" {
 name          = var.subnet_name
 ip_cidr_range = "10.2.0.0/16"
 network       = var.vpc_name
 depends_on    = [google_compute_network.vpc]
 region        = var.region
}
