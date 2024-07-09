//common 
output "log_analytics_workspace_name" {
  value       = module.common.log_analytics_workspace_name
  description = "The name of Log Analytics Workspace"
}

output "recovery_services_vault_name" {
  value       = module.common.recovery_services_vault_name

}

output "storage_account_name" {
  value       = module.common.storage_account_name
  description = "The name of Storage Acc"
}

output "storage_account_primary_blob_endpoint" {
  value       = module.common.storage_account_primary_blob_endpoint
  description = "The primary blob endpoint for the storage account"
}

// database
output "db_name" {
  value       = module.database.db_name 
  description = "The name of the PostgreSQL serv"
}

output "db_fqdn" {
  value       = module.database.db_fqdn
  description = "The fqdn of the PostgreSQL server"
}

output "db_admin_username" {
  value       = module.database.db_admin_username
  description = "The administrator username for the PostgreSQL server"
}


// data disk
output "disk_ids" {
  value       = module.datadisk.disk_ids
  description = "The IDs of the created data disks"
}

output "disk_names" {
  value       = module.datadisk.disk_names
 
}

//load balanacer
output "lb_name" {
  value       = module.loadbalancer.lb_name
  description = "The name of the created load balancer"
}

output "lb_public_ip" {
  value       = module.loadbalancer.lb_public_ip
  
}

output "lb_backend_pool_id" {
  value       = module.loadbalancer.lb_backend_pool_id
  description = "The ID of the backend address pool"
}

//network
output "vnet_name" {
  value = module.network.vnet_name
}

output "vnet_address_space" {
  value = module.network.vnet_address_space
}

output "subnet_name" {
  value = module.network.subnet_name
}

output "subnet_address_space" {
  value = module.network.subnet_address_space
}

output "subnet_id" {
  value = module.network.subnet_id
}


output "nsg_name" {
  value = module.network.nsg_name
}


//resorce groups
output "network_rg_name" {
  value = module.resource_group.network_rg_name
}



// vm - linux
output "vm_hostnames" {
  value = module.linux_vms.vm_hostnames
}

output "vm_domain_names" {
  value = module.linux_vms.vm_domain_names
}

output "vm_private_ips" {
  value = module.linux_vms.vm_private_ips
}

output "vm_public_ips" {
  value = module.linux_vms.vm_public_ips
}

output "vm_nic_ids" {
  value = module.linux_vms.vm_nic_ids
}

//windows vm

output "windows_vm_hostnames" {
  value = module.windows_vms.vm_hostnames
}

output "windows_vm_domain_names" {
  value = module.windows_vms.vm_domain_names
}

output "windows_vm_private_ips" {
  value = module.windows_vms.vm_private_ips
}

output "windows_vm_public_ips" {
  value = module.windows_vms.vm_public_ips
}

