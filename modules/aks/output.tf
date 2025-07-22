output "aks_cluster_id" {
  value       = azurerm_kubernetes_cluster.aks.id
  description = "The ID of the AKS cluster"
}

output "aks_cluster_name" {
  value       = azurerm_kubernetes_cluster.aks.name
  description = "The name of the AKS cluster"
}

output "kube_config" {
  value       = azurerm_kubernetes_cluster.aks.kube_config_raw
  description = "Raw Kubernetes configuration"
  sensitive   = true
}

output "default_node_pool_name" {
  value       = azurerm_kubernetes_cluster.aks.default_node_pool[0].name
  description = "Name of the default agent node pool"
}

output "user_node_pool_name" {
  value       = azurerm_kubernetes_cluster_node_pool.custom_user_pool.name
  description = "Name of the custom user-defined node pool"
}
