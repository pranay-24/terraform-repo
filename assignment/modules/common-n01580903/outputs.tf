output "log_analytics_workspace_name" {
  value       = azurerm_log_analytics_workspace.log_workspace.name
  description = "The name of Log Analytics Workspace"
}

output "recovery_services_vault_name" {
  value       = azurerm_recovery_services_vault.vault.name

}

output "storage_account_name" {
  value       = azurerm_storage_account.storage.name
  description = "The name of Storage Acc"
}

output "storage_account_primary_blob_endpoint" {
  value       = azurerm_storage_account.storage.primary_blob_endpoint
  description = "The primary blob endpoint for the storage account"
}