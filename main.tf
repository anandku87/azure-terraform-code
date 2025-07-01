module "network" {
  source              = "./modules/network"
  resource_group_name = var.resource_group_name
  vnet_name           = var.vnet_name
  location            = var.location
  address_space       = var.address_space
  wn_subnet_prefix    = var.wn_subnet_prefix
}
