output "aws_region" {
  value = "${var.aws_region}"
}

output "nomad_servers_cluster_tag_key" {
  value = "${module.nomad.nomad_servers_cluster_tag_key}"
}

output "nomad_servers_cluster_tag_value" {
  value = "${module.nomad.nomad_servers_cluster_tag_value}"
}

output "num_nomad_servers" {
  value = "${module.nomad.num_nomad_servers}"
}

output "nomad_clients_public_services_cluster_tag_value" {
  value = "${module.nomad.clients_public_services_cluster_tag_value}"
}

output "nomad_ui_alb_dns" {
  value = "${module.ui-access.nomad_ui_alb_dns}"
}

output "consul_ui_alb_dns" {
  value = "${module.ui-access.consul_ui_alb_dns}"
}

output "fabio_ui_alb_dns" {
  value = "${module.ui-access.fabio_ui_alb_dns}"
}
