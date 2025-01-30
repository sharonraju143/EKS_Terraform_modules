output "eks_role_arn" {
  description = "ARN of the IAM role for the EKS cluster"
  value       = aws_iam_role.eks.arn
}

output "node_role_arn" {
  description = "ARN of the IAM role for the EKS nodes"
  value       = aws_iam_role.nodes.arn
}
