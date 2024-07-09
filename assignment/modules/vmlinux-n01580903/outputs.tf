output "vm_hostnames" {
  value = values(azurerm_linux_virtual_machine.vm)[*].name
}

output "vm_domain_names" {
  value = values(azurerm_public_ip.public_ip)[*].fqdn
}

output "vm_private_ips" {
  value = values(azurerm_network_interface.nic)[*].private_ip_address
}

output "vm_public_ips" {
  value = values(azurerm_public_ip.public_ip)[*].ip_address
}

output "vm_nic_ids" {
  value = values(azurerm_network_interface.nic)[*].id
}

output "vm_ids" {
  value = values(azurerm_linux_virtual_machine.vm)[*].id
}