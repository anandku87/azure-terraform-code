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
  cluster_name          = var.cluster_name
  kubernetes_version    = var.kubernetes_version
  aks_pricing_tier      = var.aks_pricing_tier
  enable_private_cluster = var.enable_private_cluster
  automatic_upgrade_enabled = var.automatic_upgrade_enabled
  node_security_channel = var.node_security_channel
  subnet_id             = module.network.wn_subnet_id
  use_custom_vnet       = true

  # 👇 Node pool settings
  user_node_pool_name   = var.user_node_pool_name
  node_vm_size          = var.user_node_pool_vm_size
  node_count_min        = var.min_count
  node_count_max        = var.max_count
}
