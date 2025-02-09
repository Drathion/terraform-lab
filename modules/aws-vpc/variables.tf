variable "subnet_blocks" {
  description = "Mapping of subnets used by the management cluster"
  type = map(string)
}

variable "project_name" {
  description = "The project name to use for naming convention and tags"
  type        = string
}