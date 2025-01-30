variable "eks_cluster_role_name" {
  description = "Name of the IAM role for the EKS cluster"
  type        = string
}

variable "eks_node_role_name" {
  description = "Name of the IAM role for the EKS nodes"
  type        = string
}

variable "environment" {
  description = "Environment name (e.g., dev, poc, prod)"
  type        = string
}
