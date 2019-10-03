output "ip_address" {
  value = "${data.azurerm_public_ip.agent.ip_address}"
}
