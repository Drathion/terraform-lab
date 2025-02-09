locals {
  default_tags = tomap({
    "project" = var.project_name
  })
}

resource "aws_vpc" "practice-vpc" {
    cidr_block = "10.10.0.0/16"

    tags = merge (
      local.default_tags,
      {
        Name = "${var.project_name}-vpc"
      }
    )
}

resource "aws_subnet" "terraform-lab-subnet-private" {
  for_each = var.subnet_blocks
  vpc_id = aws_vpc.practice-vpc.id
  cidr_block = each.value

  tags = merge(
    local.default_tags,
    {
      Name = "${var.project_name}-subnet"
    }
  )
}



