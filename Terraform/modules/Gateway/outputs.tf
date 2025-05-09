# Azure Application Gateway outputs
output "backend_pool_id" {
  value = tolist(azurerm_application_gateway.Gateway.backend_address_pool)[0].id
}

output "gateway_public_ip_address" {
  value = azurerm_public_ip.Gateway_public_Ip.ip_address
}
