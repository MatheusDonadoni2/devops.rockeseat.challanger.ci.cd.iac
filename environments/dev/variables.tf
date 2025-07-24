variable "service_name" {
  type        = string
  description = "The name of an service name"
}

variable "enviroment" {
  type        = string
  default     = "dev"
  description = "The name of an enviromet"
}

variable "aws_region" {
  type        = string
  description = "The name of an a AWS region"
}