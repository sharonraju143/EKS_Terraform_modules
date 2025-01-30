# resource "aws_eks_cluster" "eks" {
#   name     = var.eks_name
#   version  = var.eks_version
#   role_arn = var.eks_role_arn

#   vpc_config {
#     subnet_ids = var.subnet_ids
#     endpoint_private_access = false
#     endpoint_public_access  = true
#   }
# }

# resource "aws_eks_node_group" "nodes" {
#   cluster_name    = aws_eks_cluster.eks.name
#   node_group_name = var.node_group_name
#   node_role_arn   = var.node_role_arn
#   subnet_ids      = var.subnet_ids

#   scaling_config {
#     desired_size = var.desired_capacity
#     max_size     = var.max_capacity
#     min_size     = var.min_capacity
#   }

#   instance_types = var.instance_types
#   capacity_type  = "ON_DEMAND"
#   depends_on = [
#     aws_eks_cluster.eks,                 # Ensure the EKS cluster is created
#     aws_iam_role.node_role,              # Ensure the IAM role for nodes is created
#     aws_iam_role_policy_attachment.cni,  # Ensure CNI policy attachment
#     aws_iam_role_policy_attachment.worker_node_policy,  # Ensure Worker Node Policy
#     aws_iam_role_policy_attachment.ecr_read_only        # Ensure ECR policy
#   ]
# }
# modules/eks/main.tf

resource "aws_iam_role" "node_role" {
  name = "${var.eks_name}-node-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "worker_node_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.node_role.name
}

resource "aws_iam_role_policy_attachment" "ecr_read_only" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.node_role.name
}

resource "aws_iam_role_policy_attachment" "cni" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.node_role.name
}

resource "aws_eks_node_group" "nodes" {
  cluster_name    = aws_eks_cluster.eks.name
  node_group_name = var.node_group_name
  node_role_arn   = aws_iam_role.node_role.arn
  subnet_ids      = var.subnet_ids

  scaling_config {
    desired_size = var.desired_capacity
    max_size     = var.max_capacity
    min_size     = var.min_capacity
  }

  instance_types = var.instance_types
  capacity_type  = "ON_DEMAND"

  depends_on = [
    aws_eks_cluster.eks,
    aws_iam_role.node_role,
    aws_iam_role_policy_attachment.cni,
    aws_iam_role_policy_attachment.worker_node_policy,
    aws_iam_role_policy_attachment.ecr_read_only
  ]
}

resource "aws_eks_cluster" "eks" {
  name     = var.eks_name
  version  = var.eks_version
  role_arn = var.eks_role_arn

  vpc_config {
    subnet_ids = var.subnet_ids
    endpoint_private_access = false
    endpoint_public_access  = true
  }
}
