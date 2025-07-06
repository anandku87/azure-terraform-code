resource "azurerm_kubernetes_cluster_node_pool" "user" {
  name                  = var.user_node_pool_name
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id
  vm_size               = var.node_vm_size
  os_sku                = var.os_sku
  node_count            = var.user_node_count
  min_count             = var.min_node_count
  max_count             = var.max_node_count
  enable_auto_scaling   = var.min_node_count != var.max_node_count
  vnet_subnet_id        = var.subnet_id
  mode                  = "User"
}
