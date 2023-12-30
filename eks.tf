locals {
  cluster_version = "1.27"
  node_type       = "t3.small"
  capacity_type   = "ON_DEMAND"
}

module "eksv2" {
  source = "./modules/eks"

  name_prefix     = "hyunsu"
  cluster_version = local.cluster_version
  instance_type   = local.node_type
  capacity_type   = local.capacity_type

  vpc_id                 = module.vpc.vpc_id
  public_subnets         = module.vpc.public_subnet_ids
  nodegroup_min_size     = 1
  nodegroup_max_size     = 3
  nodegroup_desired_size = 2
}

output "cluster_id" {
  value = module.eksv2.cluster_id
}
