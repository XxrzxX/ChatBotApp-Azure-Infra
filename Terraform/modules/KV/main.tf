# Key Vault module


resource "azurerm_key_vault" "kv" {
  name                        = "${var.kv_name}${random_string.unique_suffix.id}${random_integer.unique_number.result}"
  location                    = var.location
  resource_group_name         = var.resource_group_name
  enabled_for_disk_encryption = true
  tenant_id                   = local.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false
  enable_rbac_authorization   = true
  sku_name                    = "standard"

  access_policy {
    tenant_id = local.tenant_id
    object_id = local.object_id
  }
  
  tags = {
    environment = "production"
    name = "SDAProject"
  }

}

# Role assignments
resource "azurerm_role_assignment" "key_vault_admin" {
  scope                = data.azurerm_subscription.primary.id
  role_definition_name = var.Kv_rule
  principal_id         = local.object_id
} 

resource "azurerm_role_assignment" "key_vault_managed_identity" {
  scope                = data.azurerm_subscription.primary.id
  role_definition_name = var.KvMG_rule 
  principal_id         = var.MG_id
}

# Key Vault Secrets - Streamlined using `for_each`
resource "azurerm_key_vault_secret" "secrets" {
  for_each    = local.secrets
  name        = each.key
  value       = each.value
  key_vault_id = local.key_vault_id
}
