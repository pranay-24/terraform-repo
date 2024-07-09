output "vm_hostnames" {
  value = azurerm_windows_virtual_machine.vm[*].name
}

output "vm_domain_names" {
  value = azurerm_public_ip.public_ip[*].fqdn
}

output "vm_private_ips" {
  value = azurerm_network_interface.nic[*].private_ip_address
}

output "vm_public_ips" {
  value = azurerm_public_ip.public_ip[*].ip_address
}

output "vm_ids" {
  value = azurerm_windows_virtual_machine.vm[*].id
}