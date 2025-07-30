resource "azurerm_kubernetes_cluster_node_pool" "user" {
  name                  = var.user_node_pool_name
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id
  vm_size               = var.node_vm_size
  os_sku                = "Ubuntu"
  mode                  = "User"
  enable_auto_scaling   = true
  min_count             = var.node_count_min
  max_count             = var.node_count_max
  orchestrator_version  = var.kubernetes_version
}
