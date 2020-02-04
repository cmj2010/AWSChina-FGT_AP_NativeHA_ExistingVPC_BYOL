provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region
}

module "fg1" {
  source     = "./modules/fgt1"
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region

  vpc_id             = var.terraformvpc_id
  public_subnet1_id  = var.public_subnet1_id
  private_subnet1_id = var.private_subnet1_id
  ha_subnet1_id      = var.hasync_subnet1
  mgt_subnet1_id     = var.hamgmt_subnet1_id
  availability_zone  = var.availability_zone1
  ami                = "ami-0a3925c3cc1847f42"
  keypair            = var.keypair
  user_data          = data.template_file.fgt1_userdata.rendered
  instance_type      = var.instance_type
  fgt_byol_license   = var.fgt1_byol_license
  tag_name_prefix    = var.tag_name_prefix
  tag_name_unique    = "1"
}

data "template_file" "fgt1_userdata" {
  template = file("./fgt1-userdata.tpl")

  vars = {
    fgt1_byol_license         = file("${path.root}/${var.fgt1_byol_license}")
    fgt1_id                   = "fgt-1"
    fgt1_port1                = module.fg1.fgt_port1_ip
    fgt1_port2                = module.fg1.fgt_port2_ip
    fgt1_port3                = module.fg1.fgt_port3_ip
    fgt1_port4                = module.fg1.fgt_port4_ip
    fgt2_port3                = module.fg2.fgt_port3_ip
    public_subnet1_router_ip  = var.public_subnet1_router_ip
    hamgmt_subnet1_router_ip  = var.hamgmt_subnet1_router_ip
  }
}

module "fg2" {
  source     = "./modules/fgt2"
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region

  vpc_id             = var.terraformvpc_id
  public_subnet1_id  = var.public_subnet2_id
  private_subnet1_id = var.private_subnet2_id
  ha_subnet1_id      = var.hasync_subnet2_id
  mgt_subnet1_id     = var.hamgmt_subnet2_id
  availability_zone  = var.availability_zone2
  ami                = "ami-0a3925c3cc1847f42"
  keypair            = var.keypair
  user_data          = data.template_file.fgt2_userdata.rendered
  instance_type      = var.instance_type
  fgt_byol_license   = var.fgt2_byol_license
  tag_name_prefix    = var.tag_name_prefix
  tag_name_unique    = "2"
}

data "template_file" "fgt2_userdata" {
  template = file("./fgt2-userdata.tpl")

  vars = {
    fgt1_byol_license         = file("${path.root}/${var.fgt2_byol_license}")
    fgt2_id                   = "fgt-2"
    fgt2_port1                = module.fg2.fgt_port1_ip
    fgt2_port2                = module.fg2.fgt_port2_ip
    fgt2_port3                = module.fg2.fgt_port3_ip
    fgt2_port4                = module.fg2.fgt_port4_ip
    fgt1_port3                = module.fg1.fgt_port3_ip
    public_subnet2_router_ip  = var.public_subnet2_router_ip
    hamgmt_subnet2_router_ip  = var.hamgmt_subnet2_router_ip
  }
}

