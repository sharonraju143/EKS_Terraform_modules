variable "environment" {
  description = "Environment name (e.g., dev, poc, prod)"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
}

variable "eks_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "eks_version" {
  description = "EKS cluster version"
  type        = string
}

variable "desired_capacity" {
  description = "Desired capacity for the node group"
  type        = number
}

variable "max_capacity" {
  description = "Maximum capacity for the node group"
  type        = number
}

variable "min_capacity" {
  description = "Minimum capacity for the node group"
  type        = number
}

variable "instance_types" {
  description = "Instance types for the node group"
  type        = list(string)
}
