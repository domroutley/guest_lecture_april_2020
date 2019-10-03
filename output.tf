output "ip_address" {
  value = "${data.azurerm_public_ip.agent.ip_address}"
}

data "azurerm_public_ip" "agent" {
  name                = "${azurerm_public_ip.agent.name}"
  resource_group_name = "${azurerm_virtual_machine.agent.resource_group_name}"
}
