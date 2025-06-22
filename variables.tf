variable "subscription_id" {
  type = string
}

variable "location" {
  type    = string
  default = "eastus"
}
variable "resource_group_name" {
  type = string
}

variable "address_space" {
  type = list(string)
}

variable "vnet_name" {
  type = string
}

variable "subnets" {
  type = map(string)
}

