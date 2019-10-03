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
  os_profile_windows_config {
    timezone = "UTC"
  }

  storage_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }

  storage_os_disk {
    name              = "${var.prefix}-OS_disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "Agent"
    admin_username = "${var.os_user}"
    admin_password = "${var.os_pass}"
  }
}
