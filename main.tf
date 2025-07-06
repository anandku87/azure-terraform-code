module "network" {
  source              = "./modules/network"
  resource_group_name = var.resource_group_name
  vnet_name           = var.vnet_name
  location            = var.location
  address_space       = var.address_space
  wn_subnet_prefix    = var.wn_subnet_prefix
}

module "AKS" {
  source = "./modules/AKS"
  aks_name = var.aks_name
  dns_prefix = var.dns_prefix
  user_node_pool_name = var.user_node_pool_name
  resource_group_name = var.resource_group_name
  location            = var.location
  wn_subnet_prefix    = module.network.wn_subnet_id
}
