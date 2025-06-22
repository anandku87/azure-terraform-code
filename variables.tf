variable "subscription_id" {
  type = string
}

variable "location" {
  type = string
}

variable "vnet_name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "address_space" {
  type = list(string)
}

variable "subnets" {
  type = map(string)
}

variable "ssh_public_key_path" {
  type = string
}

variable "vm_instances" {
  type = list(object({
    name        = string
    subnet_name = string
  }))
}
