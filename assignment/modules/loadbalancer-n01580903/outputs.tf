output "lb_name" {
  value       = azurerm_lb.lb.name
  description = "The name of the created load balancer"
}

output "lb_public_ip" {
  value       = azurerm_public_ip.lb_pip.ip_address
  
}

output "lb_backend_pool_id" {
  value       = azurerm_lb_backend_address_pool.backend_pool.id
  description = "The ID of the backend address pool"
}