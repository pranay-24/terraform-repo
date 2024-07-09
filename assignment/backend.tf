terraform {
  backend "azurerm" {
    resource_group_name  = "tfstaten01580903RG"
    storage_account_name = "tfstaten01580903sa"
    container_name       = "tfstatefiles"
    key                  = "terraform.tfstate"
  }
}