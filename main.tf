module "network" {
  source              = "./modules/network"
  resource_group_name = var.resource_group_name
  vnet_name           = var.vnet_name
  location            = var.location
  address_space       = var.address_space
  wn_subnet_prefix    = var.wn_subnet_prefix
}

module "aks" {
  source                = "./modules/aks"
  resource_group_name   = var.resource_group_name
  location              = var.location
  aks_cluster_name      = var.aks_cluster_name
  dns_prefix            = var.dns_prefix
  kubernetes_version    = var.kubernetes_version
  node_count            = var.node_count
  vm_size               = var.vm_size
  enable_private_network = var.enable_private_network
  subnet_id             = module.network.wn_subnet_id

  # 👇 User-defined node pool parameters
  user_node_pool_name       = var.user_node_pool_name
  user_node_pool_vm_size    = var.user_node_pool_vm_size
  user_node_pool_node_count = var.user_node_pool_node_count
  user_node_pool_os_type    = var.user_node_pool_os_type
  enable_auto_scaling       = var.enable_auto_scaling
  min_count                 = var.min_count
  max_count                 = var.max_count
}
