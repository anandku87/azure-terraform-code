# Network Variables
variable "subscription_id" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "vnet_name" {
  type = string
}

variable "location" {
  type = string
}

variable "address_space" {
  type = list(string)
}

variable "wn_subnet_prefix" {
  type = string
}

## AKS Cluster Details ##

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
  description = "Enable automatic upgrades"
  type        = bool
  default     = false
}

variable "node_security_channel" {
  description = "Enable Node security channel updates"
  type        = bool
  default     = false
}

variable "user_node_pool_name" {
  description = "Name of the user node pool"
  type        = string
}

variable "node_vm_size" {
  description = "VM size for node pool"
  type        = string
  default     = "Standard D2pls v6"
}

variable "node_count_min" {
  description = "Minimum number of nodes"
  type        = number
  default     = 1
}

variable "node_count_max" {
  description = "Maximum number of nodes"
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

