resource "azurerm_virtual_network" "agent" {
  name = "${var.prefix}-virtual_network"
  resource_group_name = "${azurerm_resource_group.agent.name}"
  address_space = ["10.0.0.0/16"]
  location = "${var.location}"
}

resource "azurerm_network_interface" "agent" {
  resource_group_name = "${azurerm_resource_group.agent.name}"
  name = "${var.prefix}-network_interface"
  location = "${var.location}"
}

resource "azurerm_public_ip" "agent" {
  resource_group_name = "${azurerm_resource_group.agent.name}"
  name = "${var.prefix}-public_ip"
  location = "${var.location}"
  allocation_method = "Dynamic"
}

resource "azurerm_network_security_group" "agent" {
  resource_group_name = "${azurerm_resource_group.agent.name}"
  name = "${var.prefix}-network_security_group"
  location = "${var.location}"
  # security_rule {
  #   name                       = "RDP Access"
  #   priority                   = 100
  #   direction                  = "Inbound"
  #   access                     = "Allow"
  #   protocol                   = "Tcp"
  #   source_port_range          = "*"
  #   destination_port_range     = "3389"
  #   source_address_prefix      = "*"
  #   destination_address_prefix = "*"
  # }
}
