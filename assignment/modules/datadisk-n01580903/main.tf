resource "azurerm_managed_disk" "data_disk" {
  count                = 4
  name                 = "${var.disk_name_prefix}-${count.index + 1}"
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = var.storage_account_type
  create_option        = "Empty"
  disk_size_gb         = var.disk_size_gb
}
/*
resource "azurerm_virtual_machine_data_disk_attachment" "disk_attachment" {
  count              = var.disk_count * length(var.vm_ids)
  managed_disk_id    = azurerm_managed_disk.data_disk[count.index].id
  virtual_machine_id = var.vm_ids[floor(count.index / var.disk_count)]
  lun                = count.index 
  caching            = "ReadWrite"
}
*/

resource "azurerm_virtual_machine_data_disk_attachment" "data_disk_attachment" {
  count              = length(concat(var.linux_vm_ids, var.windows_vm_ids))
  managed_disk_id    = azurerm_managed_disk.data_disk[count.index % length(azurerm_managed_disk.data_disk)].id
  virtual_machine_id = element(concat(var.linux_vm_ids, var.windows_vm_ids), count.index)
  lun                = count.index
  caching            = "ReadWrite" 


}