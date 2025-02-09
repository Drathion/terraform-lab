terraform {
    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "~> 5.80"
      }
    }
}

provider "aws" {
    region = "us-east-2"
    access_key = var.AWS_ACCESS_KEY_ID
    secret_key = var.AWS_SECRET_ACCESS_KEY
}

locals {
  subnet_blocks = tomap({
    "a" = "10.10.1.0/24"
    "b" = "10.10.2.0/24"
    "c" = "10.10.3.0/24"
  })
}

resource "aws_vpc" "practice-vpc" {
    cidr_block = "10.10.0.0/16"

    tags = {
      "tf-project" = "terraform-lab"
      "Name" = "terraform-lab" # Name is the default "AWS Name" tag. Case sensitive
    }
}

resource "aws_subnet" "terraform-lab-subnet-private" {
  for_each = local.subnet_blocks
  vpc_id = aws_vpc.practice-vpc.id
  cidr_block = each.value

  tags = {
    "Name" = each.key
    "tf-project" = "aws-practice"
  }
}

