variable "vpc_name" {
  type        = string
  default     = "test-vpc"
  description = "VPC for creating resources"
}

variable "region" {
  type        = string
  default     = "us-east1"
  description = "Region for vpc"
}

variable "subnet_name" {
  type        = string
  default     = "test"
  description = "Name of the Subnet to be Created"
}
