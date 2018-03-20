variable "aws_region" {
  description = "region this stack should be applied to"
}

variable "nomad_ami_id" {
  description = "The ID of the AMI to be used for the nomad nodes."
}

variable "consul_ami_id" {
  description = "The ID of the AMI to be used for the consul nodes."
}

variable "ssh_key_name" {
  description = "The name of an EC2 Key Pair that can be used to SSH to the EC2 Instances in this cluster. Set to an empty string to not associate a Key Pair."
  default     = ""
}

variable "env_name" {
  description = "name of the environment (i.e. prod)"
}