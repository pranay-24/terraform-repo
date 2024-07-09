output "db_name" {
  value       = azurerm_postgresql_server.postgres.name
  description = "The name of the PostgreSQL serv"
}

output "db_fqdn" {
  value       = azurerm_postgresql_server.postgres.fqdn
  description = "The fqdn of the PostgreSQL server"
}

output "db_admin_username" {
  value       = "${azurerm_postgresql_server.postgres.administrator_login}@${azurerm_postgresql_server.postgres.name}"
  description = "The administrator username for the PostgreSQL server"
}