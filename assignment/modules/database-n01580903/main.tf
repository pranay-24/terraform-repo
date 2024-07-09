resource "azurerm_postgresql_server" "postgres" {
  name                = var.db_name
  location            = var.location
  resource_group_name = var.resource_group_name

  sku_name = var.sku_name

  storage_mb                   = var.storage_mb
  backup_retention_days        = var.backup_retention_days
  geo_redundant_backup_enabled = var.geo_redundant_backup_enabled
  auto_grow_enabled            = var.auto_grow_enabled

  administrator_login          = var.admin_username
  administrator_login_password = var.admin_password
  version                      = var.postgres_version
  ssl_enforcement_enabled      = var.ssl_enforcement_enabled

  public_network_access_enabled = var.public_network_access_enabled
}

resource "azurerm_postgresql_database" "db" {
  name                = var.database_name
  resource_group_name = var.resource_group_name
  server_name         = azurerm_postgresql_server.postgres.name
  charset             = "UTF8"
  collation           = "English_United States.1252"
 
}

resource "azurerm_postgresql_firewall_rule" "firewall" {
  name                = "AllowAllAzureIPs"
  resource_group_name = var.resource_group_name
  server_name         = azurerm_postgresql_server.postgres.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}