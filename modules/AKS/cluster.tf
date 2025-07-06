resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix

  kubernetes_version  = "latest"

  default_node_pool {
    name                = var.agent_pool_name
    vm_size             = var.node_vm_size
    os_sku              = var.os_sku
    node_count          = var.agent_node_count
    min_count           = var.min_node_count
    max_count           = var.max_node_count
   # enable_auto_scaling = var.min_node_count != var.max_node_count
   # wn_subnet_prefix      = var.wn_subnet_prefix
    vnet_subnet_id = var.wn_subnet_id
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin     = "azure"
    #load_balancer_sku  = var.load_balancer_sku
    service_cidr       = "10.2.0.0/16"
    dns_service_ip     = "10.2.0.10"
    #docker_bridge_cidr = "172.17.0.1/16"
  }

  #api_server_access_profile {
  #  enable_private_cluster = true
  #}

  local_account_disabled = false

  tags = {
    environment = "dev"
  }
}
