resource "azurerm_virtual_network" "vnet" {
  name                = var.net_name
  address_space       = var.vnet_cidr
  location            = var.region
  resource_group_name = var.rg_name
}