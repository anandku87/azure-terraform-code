module "network" {
  source              = "./modules/network"
  vnet_name           = "infra-development"
  resource_group_name = var.resource_group_name
  location            = var.location
  address_space       = ["10.0.0.0/16"]

  subnets = {
    controlplane = "10.0.1.0/29"
    worker       = "10.0.2.0/28"
    lb           = "10.0.3.0/28"
  }
}
module "instances" {
  for_each = { for vm in var.vm_instances : vm.name => vm }

  source              = "./modules/instance"
  name                = each.value.name
  subnet_name         = each.value.subnet_name
  subnet_id           = module.network.subnet_ids[each.value.subnet_name]
  resource_group_name = var.resource_group_name
  location            = var.location
  ssh_public_key_path = var.ssh_public_key_path
}



