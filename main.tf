module "network" {
  source              = "./modules/network"
  vnet_name           = var.vnet_name
  resource_group_name = var.resource_group_name
  location            = var.location
  address_space       = var.address_space

  subnets = {
    aks-node-subnet = var.aks-node-subnet    
    aks-lb-subnet          = var.aks-lb-subnet
  }
}




