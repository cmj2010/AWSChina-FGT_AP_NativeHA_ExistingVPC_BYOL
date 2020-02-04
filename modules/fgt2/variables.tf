variable "access_key" {}

variable "secret_key" {}

variable "region" {}

variable "vpc_id" {
  default = "vpc-11111111111111111111"
}

variable "cidr_for_access" {
  default = "0.0.0.0/0"
}

variable "public_subnet1_id" {
  default = "subnet-1111111111111111111"
}

variable "public_subnet2_id" {
  default = "subnet-1111111111111111111"
}

variable "private_subnet1_id" {
  default = "sbunet-1111111111111111111"

}

variable "private_subnet2_id" {
  default = "sbunet-1111111111111111111"

}
variable "ha_subnet1_id" {
  default = "subnet-1111111111111111111"
}

variable "ha_subnet2_id" {
  default = "subnet-1111111111111111111"
}
variable "mgt_subnet1_id" {
  default = "sbunet-1111111111111111111"

}
variable "mgt_subnet2_id" {
  default = "sbunet-1111111111111111111"

}

variable "ami" {
  description = "Provide an AMI for the FortiGate instance"
  default     = ""
}

variable "instance_type" {
  description = "Provide the instance type for the FortiGate instance"
  default     = "c5.large"
}

variable "keypair" {
  description = "Provide a keypair for accessing the FortiGate instance"
  default     = ""
}

variable "availability_zone" {
  description = "Provide the availability zone to create resources in"
  default     = "cn-north-1a"
}

variable "fgt_byol_license" {
  default = ""
}

variable "user_data" {
  default = ""
}

variable "tag_name_prefix" {
  description = "Provide a common tag prefix value that will be used in the name tag for all resources"
  default     = "terraform"
}
variable "tag_name_unique" {
  description = "Provide a unique tag prefix value that will be used in the name tag for each modules resources"
  default     = "automatically gathered by terraform modules"
}



