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
#module "instances" {
#  for_each = { for vm in var.vm_instances : vm.name => vm }

#  source              = "./modules/instance"
#  name                = each.value.name
#  subnet_name         = each.value.subnet_name
#  subnet_id           = module.network.subnet_ids[each.value.subnet_name]
#  resource_group_name = var.resource_group_name
#  location            = var.location
#  ssh_public_key_path = var.ssh_public_key_path
#}



