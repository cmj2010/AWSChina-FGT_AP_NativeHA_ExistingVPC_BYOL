variable "fgt-byol-amis" {
  description = "FortiGate BYOL AMIs by region"
  type        = map(string)
  default = {
    "cn-north-1"     = "ami-0627b3a7eda5c2d32"
    "cn-northwest-1" = "ami-0de3500e0ceca2b0b"
  }
}

