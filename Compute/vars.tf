variable "machine-type" {
  type        = string
  default     = "n1-standard-1"
  description = "Disk to be snapshotted"
}

variable "zone" {
  type        = string
  default     = "us-east1-c"
  description = "Input from the user"
}

variable "region" {
  type        = string
  default     = "us-east1"
  description = "Input from the user"
}

variable "image" {
  type        = string
  default     = "centos-7-v20200910"
  description = "Input from the user"
}
