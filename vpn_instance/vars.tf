variable "default_region" {
  description = "default region"
}

variable "cred_path" {
  description = "your path here"
}

variable "path_to_private_key" {
  description = "path to private key"
}

variable "profile" {
  description = "the profile to use"
}

variable "ami" {
  description = "The AMI to use to build the instance"
}

variable "instance_type" {
  description = "The type of instance on which to host the instance"
}

variable "instance_name" {
  description = "name tag of the instance"
}

variable "env" {
  description = "The environment the instance will reside in"
}

variable "key_name" {
  description = "The KeyName to use when creating the instance"
}

variable "subnet_id" {
  description = "Thye VPC Subnet to launch in"
}

variable "security_group_ids" {
  description = "Add your security groups seperated by comma to associate with the instance"
}

variable "public_ssh_key" {
  description = "the local ssh public key that goes on the instance"
}

variable "private_ssh_key" {
  description = "(optional by uncomment this part in the module) private_key"
}

variable "destination_path" {
  description = "path of the destination public ssh"
}

variable "vpn_username" {
  description = "the username for the vpn"
}

variable "vpn_password" {
  description = "the password for the vpn"
}

variable "ip_sec_key" {
  description = "IP SEC KEY"
}