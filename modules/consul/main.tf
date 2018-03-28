# Terraform 0.9.5 suffered from https://github.com/hashicorp/terraform/issues/14399, which causes this template the
# conditionals in this template to fail.
terraform {
  required_version = ">= 0.9.3, != 0.9.5"
}

# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY THE CONSUL SERVER NODES
# ---------------------------------------------------------------------------------------------------------------------
module "consul_servers" {
  source = "git::https://github.com/hashicorp/terraform-aws-consul.git//modules/consul-cluster?ref=v0.3.1"

  cluster_name  = "${var.consul_cluster_name}"
  cluster_size  = "${var.num_consul_servers}"
  instance_type = "${var.instance_type}"

  # The EC2 Instances will use these tags to automatically discover each other and form a cluster
  cluster_tag_key   = "${var.cluster_tag_key}"
  cluster_tag_value = "${var.consul_cluster_name}"

  ami_id    = "${var.consul_ami_id}"
  user_data = "${data.template_file.user_data_consul_server.rendered}"

  vpc_id     = "${var.vpc_id}"
  subnet_ids = "${var.consul_server_subnet_ids}"

  # To make testing easier, we allow Consul and SSH requests from any IP address here but in a production
  # deployment, we strongly recommend you limit this to the IP address ranges of known, trusted servers inside your VPC.
  allowed_ssh_cidr_blocks = ["0.0.0.0/0"]

  allowed_inbound_cidr_blocks = ["0.0.0.0/0"]
  ssh_key_name                = "${var.ssh_key_name}"
}

# ---------------------------------------------------------------------------------------------------------------------
# THE USER DATA SCRIPT THAT WILL RUN ON EACH CONSUL SERVER EC2 INSTANCE WHEN IT'S BOOTING
# This script will configure and start Consul
# ---------------------------------------------------------------------------------------------------------------------
data "template_file" "user_data_consul_server" {
  template = "${file("${path.module}/user-data-consul-server.sh")}"

  vars {
    cluster_tag_key   = "${var.cluster_tag_key}"
    cluster_tag_value = "${var.consul_cluster_name}"
  }
}