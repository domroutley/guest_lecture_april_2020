resource "azurerm_resource_group" "demo_rg" {
  name     = "${var.prefix}-env-rg"
  location = var.location
}

resource "azurerm_linux_virtual_machine" "demo_vm" {
  name                            = "${var.prefix}-virtual-machine"
  resource_group_name             = azurerm_resource_group.demo_rg.name
  location                        = var.location
  network_interface_ids           = [azurerm_network_interface.demo_net_interface.id]
  size                            = var.vm_size
  admin_username                  = var.os_user

  admin_ssh_key {
    username   = var.os_user
    public_key = file("../gl_key.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
}
