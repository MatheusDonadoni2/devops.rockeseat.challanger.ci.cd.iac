variable "url" {
  type        = string
  description = "Provider URL"
}

variable "client_id_list" {
  type        = list(string)
  description = "Client ids for audiencies"

}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Creation tags"
}