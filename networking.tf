resource "azurerm_virtual_network" "agent" {
  name                = "${var.prefix}-virtual_network"
  resource_group_name = "${azurerm_resource_group.agent.name}"
  address_space       = ["10.0.0.0/16"]
  location            = "${var.location}"
}

resource "azurerm_network_interface" "agent" {
  name                = "${var.prefix}-network_interface"
  resource_group_name = "${azurerm_resource_group.agent.name}"
  location            = "${var.location}"
  ip_configuration {
    name                          = "${var.prefix}-address"
    public_ip_address_id          = "${azurerm_public_ip.agent.id}"
    private_ip_address_version    = "IPv4"
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = "${azurerm_subnet.agent.id}"
  }
}

resource "azurerm_subnet" "agent" {
  name                 = "${var.prefix}-subnet"
  resource_group_name  = "${azurerm_resource_group.agent.name}"
  virtual_network_name = "${azurerm_virtual_network.agent.name}"
  address_prefix       = "10.0.1.0/24"
}

resource "azurerm_public_ip" "agent" {
  name                = "${var.prefix}-public_ip"
  resource_group_name = "${azurerm_resource_group.agent.name}"
  location            = "${var.location}"
  allocation_method   = "Dynamic"
}
