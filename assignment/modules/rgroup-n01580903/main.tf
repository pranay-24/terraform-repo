resource "azurerm_resource_group" "network_rg" {
  name     = var.network_rg_name
  location = var.location
}
