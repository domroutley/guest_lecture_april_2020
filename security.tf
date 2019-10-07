resource "azurerm_network_security_group" "agent" {
  resource_group_name = "${azurerm_resource_group.agent.name}"
  name                = "${var.prefix}-network_security_group"
  location            = "${var.location}"
}

resource "azurerm_network_security_rule" "http_in" {
  resource_group_name         = "${azurerm_resource_group.agent.name}"
  network_security_group_name = "${azurerm_network_security_group.agent.name}"
  name                        = "Ingress-HTTP_NSG-${var.prefix}"
  description                 = "Allow HTTP access"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "${var.port_number}"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
}
