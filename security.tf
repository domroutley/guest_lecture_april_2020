resource "azurerm_network_security_group" "agent" {
  resource_group_name = "${azurerm_resource_group.agent.name}"
  name                = "${var.prefix}-network_security_group"
  location            = "${var.location}"
}

resource "azurerm_network_security_rule" "agent" {
  resource_group_name         = "${azurerm_resource_group.agent.name}"
  network_security_group_name = "${azurerm_network_security_group.agent.name}"
  name                        = "Ingress-RDP_NSG-${var.prefix}"
  description                 = "Allow RDP access"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
}
