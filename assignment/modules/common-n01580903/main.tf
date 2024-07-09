resource "azurerm_log_analytics_workspace" "log_workspace" {
  name      = var.log_analytics_workspace_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku       = "PerGB2018"
  retention_in_days   = 30
  
}

resource "azurerm_recovery_services_vault" "vault" {
  name                = var.recovery_services_vault_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"
  soft_delete_enabled = true
 
}

resource "azurerm_storage_account" "storage" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  
}