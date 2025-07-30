variable "cluster_preset" {
  description = "Cluster preset configuration"
  type        = string
  default     = "production-economy"
}

variable "cluster_name" {
  description = "AKS cluster name in format aks-region-appname-env"
  type        = string
}

variable "aks_pricing_tier" {
  description = "AKS pricing tier"
  type        = string
  default     = "Free"
}

variable "kubernetes_version" {
  description = "Version of Kubernetes to use"
  type        = string
  default     = "latest"
}

variable "automatic_upgrade_enabled" {
  description = "Enable automatic upgrades for cluster"
  type        = bool
  default     = false
}

variable "node_security_channel" {
  description = "Enable node OS security channel"
  type        = bool
  default     = false
}

variable "user_node_pool_name" {
  description = "Name of the default user node pool"
  type        = string
}

variable "node_vm_size" {
  description = "VM size for node pool"
  type        = string
  default     = "Standard_D2als_v6"
}

variable "node_count_min" {
  description = "Minimum number of nodes in node pool"
  type        = number
  default     = 1
}

variable "node_count_max" {
  description = "Maximum number of nodes in node pool"
  type        = number
  default     = 2
}

variable "enable_private_cluster" {
  description = "Enable private AKS cluster"
  type        = bool
  default     = true
}

variable "use_custom_vnet" {
  description = "Use custom Azure virtual network"
  type        = bool
  default     = true
}

variable "location" {
  description = "Azure region where AKS is deployed"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID to attach AKS cluster to"
  type        = string
}
