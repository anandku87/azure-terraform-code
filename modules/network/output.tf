output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}

output "wn_subnet_id" {
  value       = azurerm_subnet.wn_subnet.id
  description = "The ID of the worker node subnet"
}
