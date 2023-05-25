resource "azurerm_network_security_group" "nsg" {
  name                = var.nsg_name
  location            = var.region
  resource_group_name = var.rg_name
}

resource "azurerm_subnet_network_security_group_association" "nsg_subnet_link" {
  subnet_id                 = var.subnet_id
  network_security_group_id = azurerm_network_security_group.nsg.id
}