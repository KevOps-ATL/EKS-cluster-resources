
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

module "ec2" {
  source    = "./modules/ec2"
  vpc_id    = module.aws_network.vpc_id
  subnet_id = module.subnets.subnet_id
}

/*module "eks" {
  source    = "./modules/eks"
  subnet_id = module.subnets.subnet_id
}


module "privsubs" {
  source = "./modules/privsubs"
  vpc_id = module.aws_network.vpc_id
}
*/
