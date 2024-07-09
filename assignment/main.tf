module "resource_group" {
  source = "./modules/rgroup-n01580903"
  network_rg_name = "n01580903-RG"
  location        = "canadacentral"

}

module "network" {
  source                = "./modules/network-n01580903"
  resource_group_name   = module.resource_group.network_rg_name
  location              = "canadacentral"
  vnet_name             = "network-vnet0903"
  vnet_address_space    = ["10.0.0.0/16"]
  subnet_name          = "network-subnet1"
  
  subnet_address_space = ["10.0.0.0/24"]
  
  nsg_name             = "network-nsg0903"
  
}

module "common" {
  source              = "./modules/common-n01580903"
  resource_group_name = module.resource_group.network_rg_name
  location            = "canadacentral"
log_analytics_workspace_name = "log-workspace0903"
recovery_services_vault_name = "vault0903"
storage_account_name="stg0903"

}

module "linux_vms" {
  source               = "./modules/vmlinux-n01580903"
  resource_group_name  = module.resource_group.network_rg_name
  location             = "canadacentral"
  subnet_id            = module.network.subnet_id
  storage_account_uri  = module.common.storage_account_primary_blob_endpoint
  public_key_path      = "/home/n01580903/.ssh/id_rsa.pub"
  private_key_path     = "/home/n01580903/.ssh/id_rsa"
  admin_username="n01580903"
  vm_map = {
    "vm1" = { size = "Standard_B1s" },
    "vm2" = { size = "Standard_B1s" },
    "vm3" = { size = "Standard_B1s" }
  }
  
}

module "windows_vms" {
  source              = "./modules/windows-n01580903"
  resource_group_name = module.resource_group.network_rg_name
  location            = "canadacentral"
  subnet_id           = module.network.subnet_id
  storage_account_uri = module.common.storage_account_primary_blob_endpoint
  admin_username      = "n01580903"
  admin_password      = "pranay,1990"  
  vm_count            = 1 
 
}
/*
module "datadisk" {
  source              = "./modules/datadisk-n01580903"
  resource_group_name = module.resource_group.network_rg_name
  location            = "canadacentral"
  vm_ids              = concat(
    module.linux_vms.vm_ids,
    module.windows_vms.vm_ids
  )
  disk_count          = 4
  disk_size_gb        = 10
}
*/
module "datadisk"{
  source              = "./modules/datadisk-n01580903"
  resource_group_name = module.resource_group.network_rg_name
  location            = "canadacentral"
  linux_vm_ids        = module.linux_vms.vm_ids
  windows_vm_ids      = module.windows_vms.vm_ids
  disk_count          = 4
  disk_size_gb        = 10
  
}


module "loadbalancer" {
  source              = "./modules/loadbalancer-n01580903"
  resource_group_name =module.resource_group.network_rg_name
  location            = "canadacentral"
  lb_name             = "linux-lb-n01580903"
  linux_vm_nic_ids    =module.linux_vms.vm_nic_ids
  
}

module "database" {
  source              = "./modules/database-n01580903"
  resource_group_name =module.resource_group.network_rg_name
  location            = "canadacentral"
  db_name             = "postgresql-n01580903"
  database_name="mydatabase"
  admin_username      = "n01580903"
  admin_password      = "pranay,1990"
  
}