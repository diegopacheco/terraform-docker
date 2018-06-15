variable "aws_region" {
  description = "AWS region to launch servers."
  default     = "us-west-2"
}

variable "key_name" {
  description = "Name of the SSH keypair to use in AWS."
  default     = "deployer-ley"
}

variable "key_path" {
  description = "Path to the private portion of the SSH key specified."
  default     = "~/pem.pem"
}
