resource "azurerm_virtual_network" "this" {
  name                = var.vnet_name
  address_space       = var.address_space
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "subnets" {
  for_each             = var.subnets
  name                 = each.key
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = [each.value]
}

resource "azurerm_network_security_group" "controlplane_nsg" {
  name                = "controlplane-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_network_security_rule" "from_worker_6443" {
  name                        = "allow-worker-to-controlplane-6443"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "6443"
  source_address_prefix       = var.subnets["worker"]
  destination_address_prefix  = var.subnets["controlplane"]
  network_security_group_name = azurerm_network_security_group.controlplane_nsg.name
  resource_group_name         = var.resource_group_name
}

resource "azurerm_subnet_network_security_group_association" "controlplane_nsg_attach" {
  subnet_id                 = azurerm_subnet.subnets["controlplane"].id
  network_security_group_id = azurerm_network_security_group.controlplane_nsg.id
}
