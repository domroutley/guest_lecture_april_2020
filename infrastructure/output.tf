output "ip_address" {
  value = data.azurerm_public_ip.demo_data_ip.ip_address
}

data "azurerm_public_ip" "demo_data_ip" {
  name                = azurerm_public_ip.demo_ip.name
  resource_group_name = azurerm_linux_virtual_machine.demo_vm.resource_group_name
}
