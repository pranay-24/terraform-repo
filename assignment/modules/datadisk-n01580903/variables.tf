variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}
/*
variable "vm_ids" {
  type        = list(string)
  description = "List of VM IDs to attach disks to"
}
*/

variable "disk_count" {
  type        = number
  default     = 4
  description = "Number of disks to create per VM"
}

variable "disk_name_prefix" {
  type    = string
  default = "datadisk"
}

variable "disk_size_gb" {
  type    = number
  default = 10
}

variable "storage_account_type" {
  type    = string
  default = "Standard_LRS"
}

variable "linux_vm_ids" {
  type        = list(string)
  description = "List of Linux VM IDs"
}

variable "windows_vm_ids" {
  type        = list(string)
  description = "List of Windows VM IDs"
}

