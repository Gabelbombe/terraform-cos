variable "deploy_profile" {
  description = "Specify the local AWS profile configuration to use."
}

variable "aws_region" {
  description = "The AWS region to deploy into (e.g. eu-west-1)."
  default     = "eu-west-1"
}
