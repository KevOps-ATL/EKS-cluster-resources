
module "aws_network" {
  source = "./modules/vpc"
}

module "nat" {
  source    = "./modules/nat"
  subnet_id = module.subnets.subnet_id
}

module "igw" {
  source = "./modules/igw"
  vpc_id = module.aws_network.vpc_id
}

module "subnets" {
  source = "./modules/subnets"
  vpc_id = module.aws_network.vpc_id
}