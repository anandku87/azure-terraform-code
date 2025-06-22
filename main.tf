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
