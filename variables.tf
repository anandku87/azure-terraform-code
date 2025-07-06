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

# AKS Cluster Variables
variable "aks_name" {
  type = string
}

variable "dns_prefix" {
  type = string
}

variable "enable_private_cluster" {
  type    = bool
  default = true
}

variable "node_vm_size" {
  type    = string
  default = "Standard_D2alds_v6"
}

variable "os_sku" {
  type    = string
  default = "Ubuntu"
}

variable "agent_pool_name" {
  type    = string
  default = "agentpool"
}

variable "agent_node_count" {
  type    = number
  default = 1
}

variable "user_node_pool_name" {
  type    = string
  default = "userpool"
}

variable "user_node_count" {
  type    = number
  default = 1
}

variable "min_node_count" {
  type    = number
  default = 1
}

variable "max_node_count" {
  type    = number
  default = 2
}


# Load Balancer Configuration
variable "load_balancer_sku" {
  description = "AKS load balancer"
  type = string 
  default = "standard"
}

