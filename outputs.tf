output "node_internal_ip" {
  value = module.google_compute_instance.node.*.network_interface.0.network_ip
}

output "node_external_ip" {
  value = module.google_compute_instance.node.*.network_interface.0.access_config.0.nat_ip
}

