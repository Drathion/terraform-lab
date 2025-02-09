terraform {
    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "~> 5.80"
      }
    }
}

provider "aws" {
    region = var.aws_region
    access_key = var.aws_access_key_id
    secret_key = var.aws_secret_access_key
}

locals {
  subnet_blocks = tomap({
    "a" = "10.10.1.0/24"
    "b" = "10.10.2.0/24"
    "c" = "10.10.3.0/24"
  })
  
  default_tags = tomap({
    "project" = "terraform-lab"
  })
}

resource "aws_vpc" "practice-vpc" {
    cidr_block = "10.10.0.0/16"

    tags = merge (
      local.default_tags,
      {
        Name = "terraform-lab"
      }
    )
}

resource "aws_subnet" "terraform-lab-subnet-private" {
  for_each = local.subnet_blocks
  vpc_id = aws_vpc.practice-vpc.id
  cidr_block = each.value

  tags = merge(
    local.default_tags,
    {
      Name = "terraform-lab"
    }
  )
}



