output "id" {
  description = "ID of the route table."
  value       = azurerm_route_table.this.id
}

output "name" {
  description = "Name of the route table."
  value       = azurerm_route_table.this.name
}

output "subnets" {
  description = "IDs of the subnets associated with the route table."
  value       = azurerm_route_table.this.subnets
}
