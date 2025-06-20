# main.tf
provider "aws" {
  region = "us-east-1" # 
}

module "network" {
  source = "./modules/network"
}

module "instances" {
  source            = "./modules/instances"
  instance_type     = "t2.micro"
  mongodb_ami       = "ami-04ec84a0edadc1107"
  nodejs_ami        = "ami-0c69af4db824d6ea6"
  public_subnet_ids = module.network.public_subnet_ids
  security_group_id = module.network.security_group_id

}

module "loadbalancer" {
  source              = "./modules/loadbalancer"
  public_subnet_ids   = module.network.public_subnet_ids
  security_group_id   = module.network.security_group_id
  vpc_id              = module.network.vpc_id
  nodejs_instance_ids = module.instances.nodejs_instance_ids
}


 
