
module "resource_group" {
  source  = "./modules/resource_group"
  rg_name = "rg-poc-omint"
}

module "vnet" {
  source    = "./modules/virtual_network"
  net_name  = "vnet-poc-omint"
  vnet_cidr = ["192.168.0.0/20"]
  region    = module.resource_group.rg_location
  rg_name   = module.resource_group.rg_name
}
module "subnet" {
  source       = "./modules/virtual_network/subnet"
  subnet_name  = "subnet01"
  rg_name      = module.resource_group.rg_name
  network_name = module.vnet.vnet_name
  subnet_cidr  = ["192.168.0.0/24"]
}
module "nsg" {
  source    = "./modules/virtual_network/network_security_group"
  nsg_name  = "nsg-omint"
  region    = module.resource_group.rg_location
  rg_name   = module.resource_group.rg_name
  subnet_id = module.subnet.subnet_id
}
module "deny_rule_poolout" {
  source                      = "./modules/virtual_network/network_security_rule"
  name                        = "${module.nsg.nsg_name}-allow"
  direction                   = "Inbound"
  access                      = "Allow"
  priority                    = 200
  source_port_range           = "*"
  destination_port_ranges     = ["3389", "5985"]
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  rg_name                     = module.resource_group.rg_name
  network_security_group_name = module.nsg.nsg_name
  depends_on = [
    module.nsg
  ]

}
module "vm01" {
  source    = "./modules/vm_windows"
  subnet_id = module.subnet.subnet_id
  region    = module.resource_group.rg_location
  rg_name   = module.resource_group.rg_name
  servers   = 1
  vm_name   = "w2k19omint"
  dns       = "poc-public-omint"
}

output "vm_ip" {
  value = module.vm01.public_ip

}
