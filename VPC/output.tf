output "network_name" {
  value       = google_compute_network.vpc.name
  description = "The name of the VPC being created"
}

output "subnets" {
  value       = google_compute_subnetwork.subnet.name
  description = "The created subnet resources"
}
