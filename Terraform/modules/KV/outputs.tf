# Key Vault outputs

output "key_vault_name" {
  value = azurerm_key_vault.kv.name
}

output "tenant_id" {
  value     = data.azurerm_client_config.current.tenant_id
  sensitive = true
}

output "subscription_id" {
  value     = data.azurerm_subscription.primary.id
  sensitive = true
}
