# AKS cluster base variables
variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "aks_cluster_name" {
  type = string
}

variable "dns_prefix" {
  type = string
}

variable "kubernetes_version" {
  type    = string
  default = "1.29.0"
}

variable "node_count" {
  type    = number
  default = 2
}

variable "vm_size" {
  type    = string
  default = "Standard_DS2_v2"
}

variable "enable_private_network" {
  type    = bool
  default = true
}

variable "subnet_id" {
  type = string
}

# User-defined node pool variables
variable "user_node_pool_name" {
  type    = string
  default = "userpool"
}

variable "user_node_pool_vm_size" {
  type    = string
  default = "Standard_DS3_v2"
}

variable "user_node_pool_node_count" {
  type    = number
  default = 2
}

variable "user_node_pool_os_type" {
  type    = string
  default = "Linux"
}

variable "enable_auto_scaling" {
  type    = bool
  default = true
}

variable "min_count" {
  type    = number
  default = 1
}

variable "max_count" {
  type    = number
  default = 5
}
