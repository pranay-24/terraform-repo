variable "network_rg_name" {
  type = string
 
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to add to all resources"
  default     = {}
}

variable "location" {
  type    = string
  default = "canadacentral"
}