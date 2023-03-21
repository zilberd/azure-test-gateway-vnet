output "gateway-name" {
  value = azurerm_virtual_network_gateway.net_gw.id
}

output "local-gateway-id" {
  value = azurerm_local_network_gateway.onpremise.id
}

output "gateway-pip-address" {
  value = azurerm_public_ip.gw-pip.ip_address
}