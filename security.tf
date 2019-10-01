resource "azurerm_network_security_group" "agent" {
  resource_group_name = "${azurerm_resource_group.agent.name}"
  name                = "${var.prefix}-network_security_group"
  location            = "${var.location}"
}
