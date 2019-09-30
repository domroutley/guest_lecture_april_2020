resource "azurerm_resource_group" "agent" {
  name     = "${var.prefix}"
  location = "${var.location}"
}

resource "azurerm_virtual_machine" "agent" {
  name = "${var.prefix}-virtual_machine"
  resource_group_name = "${azurerm_resource_group.main.name}"
  location = "${var.location}"
  network_interface_ids = ["${azurerm_network_interface.agent.id}"]
  vm_size = "${var.vm_size}"
  os_profile_windows_config = TODO
}
