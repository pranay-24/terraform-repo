variable "resource_group_name" {
  type        = string

}

variable "location" {
  type        = string
  description = "Azure region where the resources will be created"
}

variable "log_analytics_workspace_name" {
  type        = string
  
  
}

variable "recovery_services_vault_name" {
  type        = string
  
  
}

variable "storage_account_name" {
  type        = string
  description = "Name of the Storage Account"

}
