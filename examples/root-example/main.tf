provider "aws" {
  profile = "${var.deploy_profile}"
  region  = "${var.aws_region}"
}

resource "random_pet" "unicorn" {
  # NOTE: Length 1 used to avoid problems with the different delimiter requierements in AWS. Nevertheless 1 should be enough.
  length = 1
}

module "networking" {
  source         = "../../modules/networking"
  region         = "${var.aws_region}"
  env_name       = "${var.env_name}"
  unique_postfix = "${random_pet.unicorn.id}"
}

module "nomad-infra" {
  source                    = "../../"
  aws_region                = "${var.aws_region}"
  vpc_id                    = "${module.networking.vpc_id}"
  nomad_server_subnet_ids   = "${module.networking.subnet_ids}"
  nomad_ami_id_servers      = "${var.ami_servers}"
  nomad_ami_id_clients      = "${var.ami_clients}"
  consul_ami_id             = "${var.ami_servers}"
  ssh_key_name              = "kp-us-east-1-playground-instancekey"
  env_name                  = "${var.env_name}"
  unique_postfix            = "${random_pet.unicorn.id}"
  nomad_cluster_name        = "${var.nomad_cluster_name}"
  consul_cluster_name       = "${var.consul_cluster_name}"
  num_nomad_servers         = "${var.num_nomad_servers}"
  num_nomad_clients         = "${var.num_nomad_clients}"
  instance_type_server      = "${var.instance_type_server}"
  instance_type_client      = "${var.instance_type_client}"
  alb_public_services_arn   = "${module.networking.alb_public_services_arn}"
  alb_backoffice_nomad_arn  = "${module.networking.alb_backoffice_nomad_arn}"
  alb_backoffice_consul_arn = "${module.networking.alb_backoffice_consul_arn}"
  alb_backoffice_fabio_arn  = "${module.networking.alb_backoffice_fabio_arn}"
}
