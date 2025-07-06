data "azurerm_subnet" "wn_subnet" {
  name                 = "your-subnet-name"
  virtual_network_name = "your-vnet-name"
  resource_group_name  = var.resource_group_name
}
