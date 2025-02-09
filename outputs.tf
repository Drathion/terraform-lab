output "subnets_cidr" {
  value = { for key, subnet in local.subnet_blocks : key => local.subnet_blocks[key] }
}

output "subnet_ids" {
  value = [for subnet in aws_subnet.terraform-lab-subnet-private : subnet.id]
}

output "subnets" {
  value = aws_subnet.terraform-lab-subnet-private[*]
}

output "vpc_cidr" {
  value = aws_vpc.practice-vpc.cidr_block
}