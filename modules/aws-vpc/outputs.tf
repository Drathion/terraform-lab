output "subnet_ids" {
  value = [for subnet in aws_subnet.terraform-lab-subnet-private : subnet.id]
}

output "subnets" {
  value = aws_subnet.terraform-lab-subnet-private[*]
}

output "vpc_cidr" {
  value = aws_vpc.practice-vpc.cidr_block
}