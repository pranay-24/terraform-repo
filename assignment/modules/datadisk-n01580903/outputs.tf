output "disk_ids" {
  value       = azurerm_managed_disk.data_disk[*].id
  description = "The IDs of the created data disks"
}

output "disk_names" {
  value       = azurerm_managed_disk.data_disk[*].name
 
}