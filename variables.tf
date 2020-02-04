variable "access_key" {
}

variable "secret_key" {
}

variable "region" {
}

variable "security_vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "security_vpc_public_subnet_cidr1" {
  default = "10.0.1.0/24"
}

variable "availability_zone1" {
  default = "cn-northwest-1a"
}

variable "security_vpc_public_subnet_cidr2" {
  default = "10.0.2.0/24"
}

variable "availability_zone2" {
  default = "cn-northwest-1b"
}

variable "security_vpc_private_subnet_cidr1" {
  default = "10.0.11.0/24"
}

variable "security_vpc_private_subnet_cidr2" {
  default = "10.0.22.0/24"
}

variable "security_vpc_ha_subnet_cidr1" {
  default = "10.0.30.0/24"
}

variable "security_vpc_ha_subnet_cidr2" {
  default = "10.0.31.0/24"
}

variable "security_vpc_mgt_subnet_cidr1" {
  default = "10.0.40.0/24"
}

variable "security_vpc_mgt_subnet_cidr2" {
  default = "10.0.41.0/24"
}

variable "keypair" {
  description = "Provide a keypair for accessing the FortiGate instance"
  default     = ""
}

variable "instance_type" {
  description = "Provide the instance type for the FortiGate instances"
  default     = "c5.xlarge"
}

variable "fgt1_byol_license" {
  description = "Provide the BYOL license filename for the first FortiGate instance, and place the file in the root module folder"
  default     = "fgt1-license.lic"
}

variable "fgt2_byol_license" {
  description = "Provide the BYOL license filename for the first FortiGate instance, and place the file in the root module folder"
  default     = "fgt2-license.lic"
}

variable "ami" {
  description = "Provide an AMI for the FortiGate instances"
  default     = "automatically gathered by terraform modules"
}

variable "iam_role" {
  description = "Provide an role for the FortiGate instances"
  default     = "FortiGate-HA"
}


variable "tag_name_prefix" {
  description = "Provide a common tag prefix value that will be used in the name tag for all resources"
  default     = "terraform"
}

variable "tag_name_unique" {
  description = "Provide a unique tag prefix value that will be used in the name tag for each modules resources"
  default     = "automatically gathered by terraform modules"
}

