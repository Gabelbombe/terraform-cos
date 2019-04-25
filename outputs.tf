output "aws_region" {
  description = "The AWS region to deploy into"
  value       = "${var.aws_region}"
}

output "nomad_servers_cluster_tag_key" {
  description = "Nomad servers identifier tag"
  value       = "${module.nomad.nomad_servers_cluster_tag_key}"
}

output "nomad_servers_cluster_tag_value" {
  description = "Nomad servers identifcation tag value"
  value       = "${module.nomad.nomad_servers_cluster_tag_value}"
}

output "num_nomad_servers" {
  description = "Amount of Nomad servers to deploy"
  value       = "${module.nomad.num_nomad_servers}"
}

output "nomad_clients_public_services_cluster_tag_value" {
  description = "Nomad clients identification tag value"
  value       = "${module.dc-public-services.cluster_tag_value}"
}

output "nomad_ui_alb_dns_name" {
  description = "Nomad UI cluster address"
  value       = "${module.ui-access.nomad_ui_alb_dns_name}"
}

output "consul_ui_alb_dns_name" {
  description = "Consul UI cluster address"
  value       = "${module.ui-access.consul_ui_alb_dns_name}"
}

output "fabio_ui_alb_dns_name" {
  description = "Fabio UI address"
  value       = "${module.ui-access.fabio_ui_alb_dns_name}"
}

output "nomad_ui_alb_zone_id" {
  description = "Nomads zone identifier"
  value       = "${module.ui-access.nomad_ui_alb_zone_id}"
}

output "consul_ui_alb_zone_id" {
  description = "Consuls zone identifier"
  value       = "${module.ui-access.consul_ui_alb_zone_id}"
}

output "fabio_ui_alb_zone_id" {
  description = "Fabios zone identifier"
  value       = "${module.ui-access.fabio_ui_alb_zone_id}"
}

output "vpc_id" {
  description = "VPC identifier"
  value       = "${var.vpc_id}"
}

output "ssh_key_name" {
  description = "SSH key in implementation"
  value       = "${var.ssh_key_name}"
}

output "cluster_prefix" {
  description = "Clustering prefix"
  value       = "${module.dc-public-services.cluster_prefix}"
}

output "dc-public-services_sg_id" {
  description = "Public services security group id"
  value       = "${module.dc-public-services.sg_datacenter_id}"
}

output "dc-private-services_sg_id" {
  description = "Private services security group id"
  value       = "${module.dc-private-services.sg_datacenter_id}"
}

output "dc-backoffice_sg_id" {
  description = "Backoffice security group id"
  value       = "${module.dc-backoffice.sg_datacenter_id}"
}

output "consul_servers_sg_id" {
  description = "Consuls security group id"
  value       = "${module.consul.security_group_id_consul_servers}"
}

output "consul_servers_cluster_tag_key" {
  description = "Consul servers tag identifier"
  value       = "${module.consul.consul_servers_cluster_tag_key}"
}

output "consul_servers_cluster_tag_value" {
  description = "Consul servers tag identification value"
  value       = "${module.consul.consul_servers_cluster_tag_value}"
}
