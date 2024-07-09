variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "storage_account_uri" {
  type = string
}

variable "vm_count" {
  type    = number
  default = 1
}

variable "vm_name_prefix" {
  type    = string
  default = "winvm"
}

variable "vm_size" {
  type    = string
  default = "Standard_B1s"
}

variable "admin_username" {
  type = string
}

variable "admin_password" {
  type      = string
  sensitive = true
}

variable "availability_set_name" {
  type    = string
  default = "windows-avset"
}

variable "dns_label_prefix" {
  type    = string
  default = "dns-win"
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to add to all resources"
  default     = {}
}