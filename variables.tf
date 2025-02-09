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
