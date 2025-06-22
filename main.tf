module "network" {
  source              = "./modules/network"
  vnet_name           = "infra-development"
  resource_group_name = "Azure-infra-anand"
  location            = "West India"
  address_space       = ["10.0.0.0/16"]

  subnets = {
    controlplane = "10.0.1.0/29"
    worker       = "10.0.2.0/28"
    lb           = "10.0.3.0/28"
  }
}
module "instance_master" {
  source              = "./modules/instance"
  name                = "master"
  subnet_name         = "controlplane"
  resource_group_name = var.resource_group_name
  location            = var.location
  subnet_id           = module.network.subnet_ids["controlplane"]
}

module "instance_slave" {
  source              = "./modules/instance"
  name                = "slave"
  subnet_name         = "worker"
  resource_group_name = var.resource_group_name
  location            = var.location
  subnet_id           = module.network.subnet_ids["worker"]
}



