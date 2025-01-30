output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "eks_cluster_id" {
  description = "The ID of the EKS Cluster"
  value       = module.eks.cluster_id
}

output "node_group_arn" {
  description = "The ARN of the EKS node group"
  value       = module.eks.node_group_arn
}
