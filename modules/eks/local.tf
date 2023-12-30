locals {
  cluster_name     = "${var.name_prefix}-cluster"
  cluster_version  = var.cluster_version
  region           = "ap-northeast-2"
  vpc_id           = var.vpc_id
  public_subnets   = var.public_subnets
  instance_type    = var.instance_type
  capacity_type    = var.capacity_type
}
