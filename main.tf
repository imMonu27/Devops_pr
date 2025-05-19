module "network" {
  source              = "./modules/network"
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  private_subnet_cidr2 = var.private_subnet_cidr2
  public_az           = var.public_az
  private_az          = var.private_az
  private_az2          = var.private_az2
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "my-eks-cluster"
  cluster_version = "1.32"
  subnet_ids      = module.network.private_subnet_id
  vpc_id          = module.network.vpc_id
  cluster_endpoint_public_access  = true
  cluster_endpoint_private_access = true
 

  eks_managed_node_groups = {
    default = {
      desired_capacity = 2
      max_capacity     = 2
      min_capacity     = 2
      instance_types = ["t2.micro"]
    }
  }

  
  
}


# module "eks_auth" {
#   source = "terraform-aws-modules/eks/aws//modules/aws-auth"
#   version = "20.8.4" # Same version as the EKS module

#   depends_on = [module.eks]

#   manage_aws_auth_configmap = true

#   aws_auth_roles = [
#     {
#       rolearn  = module.eks.eks_managed_node_groups["default"].iam_role_arn
#       username = "system:node:{{EC2PrivateDNSName}}"
#       groups   = ["system:bootstrappers", "system:nodes"]
#     }
#   ]

#   aws_auth_users = [
#      {
#     userarn  = "arn:aws:iam::061154960683:user/k8s_admin"
#     username = "k8s_admin"
#     groups   = ["system:masters"]
#   }
#   ]     
#   aws_auth_accounts = []  
# }

provider "kubernetes" {
  config_path = "~/.kube/config"
}