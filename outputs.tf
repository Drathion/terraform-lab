output "subnet_ids_from_module" {
  value = module.vpc.subnet_ids
}

output "subnets_from_module" {
  value = module.vpc.subnets
}

output "vpc_cidr_from_module" {
  value = module.vpc.vpc_cidr
}