environment        = "poc"
vpc_cidr           = "172.20.0.0/16"
availability_zones = ["us-east-1a", "us-east-1b"]
public_subnet_cidrs = ["172.20.3.0/24", "172.20.4.0/24"]
private_subnet_cidrs = ["172.20.1.0/24", "172.20.2.0/24"]
eks_name           = "poc-cluster"
eks_version        = "1.29"
desired_capacity   = 2
max_capacity       = 2
min_capacity       = 2
instance_types     = ["t3.medium"]
