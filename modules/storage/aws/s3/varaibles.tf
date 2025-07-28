variable "bucket" {
  type        = string
  description = "The of the bucket"
}

variable "force_destroy" {
  type        = bool
  description = "Tag to determine whether a bucket will be destroyed"
}

variable "region" {
  type        = string
  description = "AWS region"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Creation tags"
}