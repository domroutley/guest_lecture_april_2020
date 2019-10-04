resource "azurerm_resource_group" "agent" {
  name     = "${var.prefix}"
  location = "${var.location}"
}

resource "azurerm_virtual_machine" "agent" {
  name                  = "${var.prefix}-virtual_machine"
  resource_group_name   = "${azurerm_resource_group.agent.name}"
  location              = "${var.location}"
  network_interface_ids = ["${azurerm_network_interface.agent.id}"]
  vm_size               = "${var.vm_size}"
  os_profile_linux_config {
    disable_password_authentication = true
    ssh_keys {
      key_data = file("server.pub")
      path = "/home/${var.os_user}/.ssh/authorized_keys"
    }
  }

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name              = "${var.prefix}-OS_disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "HelloWorld"
    admin_username = "${var.os_user}"
    custom_data    = file("setup.sh")
  }
}
