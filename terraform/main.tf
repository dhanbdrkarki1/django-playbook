# Security Groups
module "sg" {
  source = "./modules/sg"
  vpc_id = module.vpc.vpc_id
}

module "vpc" {
  source           = "./modules/vpc"
  web_vpc_cidr     = var.cidr_block
  web_vpc_tenancy  = var.web_vpc_tenancy
  public_sid1      = var.public_sid1_block
  public_sid1_name = var.public_sid1_block_name
  az1              = var.az1
}


module "key-pair" {
  source       = "./modules/key-pair"
  key_name     = "django-test"
  key_filename = "django-test.pem"
}

# Elastic Cloud Compute
module "ec2" {
  source                 = "./modules/ec2"
  ami                    = var.ami
  type                   = var.type
  az1                    = var.az1
  vpc_id                 = module.vpc.vpc_id
  public_subnet1         = module.vpc.public_subnet1
  key_pair               = module.key-pair.key_name
  web_security_groups_id = module.sg.web_security_groups_id
  env                    = var.env
}

# Route 53
# module "route53" {
#   source                 = "./modules/route53"
#   domain_name            = var.domain_name
#   tag_name               = var.env
#   record_name            = var.record_name
#   ec2_public_ip          = module.ec2.web_server_1_public_ip

# }
