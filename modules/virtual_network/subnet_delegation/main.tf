resource "azurerm_subnet" "subnet_database" {
  name                 = var.subnet_name
  resource_group_name  = var.rg_name
  virtual_network_name = var.network_name
  address_prefixes     = var.subnet_cidr

  delegation {
    name = var.delegation_name

    service_delegation {
      name = var.service_delegation_name

      actions = var.service_delegation_actions
    }
  }
}
