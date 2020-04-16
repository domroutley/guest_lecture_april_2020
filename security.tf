resource "azurerm_network_security_group" "test" {
  resource_group_name = azurerm_resource_group.test.name
  name                = "${var.prefix}-network_security_group"
  location            = var.location
}

resource "azurerm_network_security_rule" "http_in" {
  resource_group_name         = azurerm_resource_group.test.name
  network_security_group_name = azurerm_network_security_group.test.name
  name                        = "Ingress-HTTP_NSG-${var.prefix}"
  description                 = "Allow HTTP access"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = var.port_number
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
}

resource "azurerm_network_security_rule" "ssh_in" {
  resource_group_name         = azurerm_resource_group.test.name
  network_security_group_name = azurerm_network_security_group.test.name
  name                        = "Ingress-SSH_NSG-${var.prefix}"
  description                 = "Allow SSH access"
  priority                    = 111
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
}
