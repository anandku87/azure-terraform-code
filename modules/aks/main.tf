resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "${var.cluster_name}-dns"

  kubernetes_version  = var.kubernetes_version
  private_cluster_enabled = var.enable_private_cluster
  sku_tier            = var.aks_pricing_tier

  default_node_pool {
    name       = var.user_node_pool_name
    vm_size    = var.node_vm_size
    os_sku     = "Ubuntu"
    node_count = var.node_count_min
    min_count  = var.node_count_min
    max_count  = var.node_count_max
    #enable_auto_scaling = true
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin     = "azure"
    network_policy     = "azure"
    dns_service_ip     = "10.0.0.10"
    service_cidr       = "10.0.0.0/16"
    docker_bridge_cidr = "172.17.0.1/16"
    outbound_type      = "userDefinedRouting"
    pod_cidr           = "10.244.0.0/16"
  }

  depends_on = [module.network]
}
