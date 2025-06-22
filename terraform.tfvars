subscription_id       = "471957fc-3c1d-4d06-925b-21b4bc773be4"
location              = "West India"
vnet_name             = "infra-development"
resource_group_name   = "Azure-infra-anand"
address_space         = ["10.0.0.0/16"]

subnets = {
  controlplane = "10.0.1.0/29"
  worker       = "10.0.2.0/28"
  lb           = "10.0.3.0/28"
}
ssh_public_key_path = "/home/codespace/.ssh/id_rsa.pub"
vm_instances = [
  {
    name        = "master"
    subnet_name = "controlplane"
  },
  {
    name        = "slave"
    subnet_name = "worker"
  }
]
