resource "azurerm_virtual_network" "demo_net" {
  name                = "${var.prefix}-virtual_network"
  resource_group_name = azurerm_resource_group.demo_rg.name
  address_space       = ["10.0.0.0/16"]
  location            = var.location
}

resource "azurerm_network_interface" "demo_net_interface" {
  name                = "${var.prefix}-network_interface"
  resource_group_name = azurerm_resource_group.demo_rg.name
  location            = var.location

  ip_configuration {
    name                          = "${var.prefix}-address"
    public_ip_address_id          = azurerm_public_ip.demo_ip.id
    private_ip_address_version    = "IPv4"
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.demo_subnet.id
  }
}

resource "azurerm_subnet" "demo_subnet" {
  name                 = "${var.prefix}-subnet"
  resource_group_name  = azurerm_resource_group.demo_rg.name
  virtual_network_name = azurerm_virtual_network.demo_net.name
  address_prefix       = "10.0.1.0/24"
}

resource "azurerm_public_ip" "demo_ip" {
  name                = "${var.prefix}-public_ip"
  resource_group_name = azurerm_resource_group.demo_rg.name
  location            = var.location
  allocation_method   = "Dynamic"
}
