# local variables for Key Vault module
locals {
  tenant_id        = data.azurerm_client_config.current.tenant_id
  object_id        = data.azurerm_client_config.current.object_id
  key_vault_id     = azurerm_key_vault.kv.id



  secrets = {
    "PROJ-DB-NAME"           = var.database_name
    "PROJ-DB-USER"           = var.admin_db_username
    "PROJ-DB-PASSWORD"       = var.db_pass
    "PROJ-DB-HOST"           = var.database_host
    "PROJ-DB-PORT"           = var.database_port
    "PROJ-OPENAI-API-KEY"    = var.OpenAi_key
    "PROJ-AZURE-STORAGE-SAS-URL" = var.storage_SAS
    "PROJ-AZURE-STORAGE-CONTAINER" = var.container
    "PROJ-CHROMADB-HOST"     = var.VM_private_ip_address
    "PROJ-CHROMADB-PORT"     = var.chromadb_port
  }
}