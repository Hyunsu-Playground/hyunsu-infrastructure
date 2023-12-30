locals {
  azs             = ["ap-northeast-2a", "ap-northeast-2c"]
  public_subnets  = ["10.0.0.0/20", "10.0.16.0/20"]
  private_subnets = ["10.0.128.0/20", "10.0.144.0/20"]
  vpc_cidr        = "10.0.0.0/16"
}

module "vpc" {
  source = "./modules/vpc"

  vpc_cidr        = local.vpc_cidr
  azs             = local.azs
  private_subnets = local.private_subnets
  public_subnets  = local.public_subnets
  name_prefix     = "hyunsu"
  cluster_name    = "hyunsu-cluster"
}

resource "aws_vpc_endpoint" "s3" {
  vpc_id       = module.vpc.vpc_id
  service_name = "com.amazonaws.ap-northeast-2.s3"
}
