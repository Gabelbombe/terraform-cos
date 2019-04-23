variable "deploy_profile" {
  description = "Specify the local AWS profile configuration to use."
}

variable "ami_id" {
  description = "Id of the AMI for the nomad and consul nodes."
  default     = "ami-02abc3480d8ecc9b7"
}
