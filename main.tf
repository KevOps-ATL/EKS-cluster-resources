
module "aws_network" {
  source = "./modules/vpc"
}

module "nat" {
  source = "./modules/nat"
}

module "igw" {
  source = "./modules/igw"
  vpc_id = module.aws_network.vpc_id
}

module "subnets" {
  source = "./modules/subnets"
  vpc_id = module.aws_network.vpc_id
}
