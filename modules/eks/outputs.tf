output "cluster_id" {
  description = "The ID of the EKS Cluster"
  value       = aws_eks_cluster.eks.id
}

output "node_group_arn" {
  description = "The ARN of the EKS node group"
  value       = aws_eks_node_group.nodes.arn
}
