locals {
  consul_cluster_tag_key   = "consul-servers"
  consul_cluster_tag_value = "${var.stack_name}-consul${var.unique_postfix}"
}
