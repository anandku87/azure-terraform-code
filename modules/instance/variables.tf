variable "name" {
  type = string
}

variable "subnet_name" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "ssh_public_key_path" {
  type    = string
  default = "~/.ssh/id_rsa.pub"
}
