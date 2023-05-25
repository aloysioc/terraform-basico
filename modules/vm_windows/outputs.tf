output "vm_name" {
  value = azurerm_windows_virtual_machine.vm[*].name
}

output "vm_id" {
  value = azurerm_windows_virtual_machine.vm[*].id
}

output "interface_id" {
  value = azurerm_network_interface.net_if[*].id
}

output "interface_name" {
  value = azurerm_network_interface.net_if[*].ip_configuration.0.name
}

output "vm_interface_private_ip" {
  value = azurerm_network_interface.net_if[*].private_ip_address
}

output "servers" {
  value = length(azurerm_windows_virtual_machine.vm)
}
output "ip_jump" {
  value = azurerm_network_interface.net_if[*].private_ip_addresses
}
output "public_ip" {
  value = azurerm_public_ip.publicip[*].ip_address
}
output "public_fqdn" {
  value = azurerm_public_ip.publicip[*].fqdn
}