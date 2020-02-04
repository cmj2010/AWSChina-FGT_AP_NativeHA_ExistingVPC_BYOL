variable "access_key" {
}

variable "secret_key" {
}

variable "region" {
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr1" {
  default = "10.0.1.0/24"
}

variable "availability_zone1" {
  default = "cn-northwest-1a"
}

variable "public_subnet_cidr2" {
  default = "10.0.2.0/24"
}

variable "availability_zone2" {
  default = "cn-northwest-1b"
}

variable "private_subnet_cidr1" {
  default = "10.0.11.0/24"
}

variable "private_subnet_cidr2" {
  default = "10.0.22.0/24"
}

variable "ha_subnet_cidr1" {
  default = "10.0.30.0/24"
}

variable "ha_subnet_cidr2" {
  default = "10.0.31.0/24"
}

variable "mgt_subnet_cidr1" {
  default = "10.0.40.0/24"
}

variable "mgt_subnet_cidr2" {
  default = "10.0.41.0/24"
}

variable "tag_name_prefix" {
  description = "Provide a common tag prefix value that will be used in the name tag for all resources"
  default     = "terraform"
}

variable "tag_name_unique" {
  description = "Provide a unique tag prefix value that will be used in the name tag for each modules resources"
  default     = "automatically gathered by terraform modules"
}

