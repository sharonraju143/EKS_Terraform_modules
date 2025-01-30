module "vpc" {
  source = "./modules/vpc"

  vpc_cidr           = var.vpc_cidr
  availability_zones = var.availability_zones
  public_subnet_cidrs = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  environment        = var.environment
}

module "iam" {
  source = "./modules/iam"

  environment           = var.environment
  eks_node_role_name    = "${var.environment}-${var.eks_name}-eks-nodes"
  eks_cluster_role_name = "${var.environment}-${var.eks_name}-eks-cluster"
}

module "eks" {
  source = "./modules/eks"

  eks_name         = var.eks_name
  eks_version      = var.eks_version
  subnet_ids       = module.vpc.private_subnets
  node_group_name  = "general"
  instance_types   = var.instance_types
  desired_capacity = var.desired_capacity
  max_capacity     = var.max_capacity
  min_capacity     = var.min_capacity
  eks_role_arn     = module.iam.eks_role_arn
  node_role_arn    = module.iam.node_role_arn  
}
