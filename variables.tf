variable "access_key" {
}

variable "secret_key" {
}

variable "region" {
}

variable "terraformvpc_id" {
default = "vpc-..."
}

variable "security_vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet1_id" {
  default = "subnet-...."
}

variable "availability_zone1" {
  default = "cn-northwest-1a"
}

variable "public_subnet2_id" {
  default = "subnet-...."
}

variable "availability_zone2" {
  default = "cn-northwest-1b"
}

variable "private_subnet1_id" {
  default = "subnet-...."
}

variable "private_subnet2_id" {
  default = "subnet-...."
}

variable "hasync_subnet1_id" {
  default = "subnet-...."
}

variable "hasync_subnet2_id" {
  default = "subnet-...."
}

variable "hamgmt_subnet1_id" {
  default = "subnet-...."
}

variable "hamgmt_subnet2_id" {
  default = "subnet-...."
}

variable "public_subnet1_router_ip" {
  default = ""
}

variable "public_subnet2_router_ip" {
  default = ""
}

variable "hamgmt_subnet1_router_ip" {
  default = ""
}

variable "hamgmt_subnet2_router_ip" {
  default = ""
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

