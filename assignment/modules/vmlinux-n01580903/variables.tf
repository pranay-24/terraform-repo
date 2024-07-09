variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "vm_map" {
  type = map(object({
    size = string
  }))
  default = {
    "vm1" = { size = "Standard_B1s" },
    "vm2" = { size = "Standard_B1s" },
    "vm3" = { size = "Standard_B1s" }
  }
}

variable "admin_username" {
  type    = string
  
}

variable "public_key_path" {
  type = string
}

variable "storage_account_uri" {
  type = string
}

variable "availability_set_name" {
  type    = string
  default = "linux-avset"
}

variable "dns_label_prefix" {
  type    = string
  default = "vmlinux"
}

