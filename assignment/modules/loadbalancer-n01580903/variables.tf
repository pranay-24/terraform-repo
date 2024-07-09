variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "lb_name" {
  type    = string
  default = "linux-lb"
}

variable "linux_vm_nic_ids" {
  type        = list(string)
  description = "List of Network Interface IDs of Linux VMs to add to the backend pool"
}
