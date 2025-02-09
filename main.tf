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

module "vpc" {
  source = "./modules/aws-vpc"
  project_name = var.project_name
  subnet_blocks = var.subnet_blocks
}