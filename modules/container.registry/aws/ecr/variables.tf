variable "name" {
  type        = string
  description = "Container registry name"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Creation tags"
}