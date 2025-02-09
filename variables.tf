variable "aws_access_key_id" {
  description = "AWS Access Key used for authentication to an AWS account"
  type        = string
  default     = ""
}

variable "aws_secret_access_key" {
  description = "AWS Secret Key used for authentication to an AWS account"  
  type        = string
  default     = ""
}

variable "aws_region" {
  description = "AWS region to deploy to"
  type        = string
  default     = "us-east-2"
}

variable "project_name" {
  description = "The project name to use for naming convention and tags"
  type        = string
}

variable "subnet_blocks" {
  description = "Mapping of subnets used by the management cluster"
  type = map(string)
}