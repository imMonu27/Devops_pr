# In your root module (main.tf or outputs.tf in root)
output "vpc_id" {
  value = module.network.vpc_id
}

output "public_subnet_id" {
  value = module.network.public_subnet_id
}

output "private_subnet_id" {
  value = module.network.private_subnet_id
}

output "cluster_name" {
  value = module.eks.cluster_name
}
