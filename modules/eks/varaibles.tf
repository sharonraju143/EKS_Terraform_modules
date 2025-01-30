variable "eks_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "eks_version" {
  description = "EKS cluster version"
  type        = string
}

variable "eks_role_arn" {
  description = "IAM role ARN for the EKS cluster"
  type        = string
}

variable "node_role_arn" {
  description = "IAM role ARN for the EKS nodes"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for the EKS cluster"
  type        = list(string)
}

variable "node_group_name" {
  description = "Name of the node group"
  type        = string
}

variable "desired_capacity" {
  description = "Desired number of nodes"
  type        = number
}

variable "max_capacity" {
  description = "Maximum number of nodes"
  type        = number
}

variable "min_capacity" {
  description = "Minimum number of nodes"
  type        = number
}

variable "instance_types" {
  description = "Instance types for the nodes"
  type        = list(string)
}
