# Storage Account Module

# Creating a Storage Account
resource "azurerm_storage_account" "StorageAccount" {
  name                     = "store-${var.random_id}"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"
  
  tags = {
    environment = "production"
    name = "SDAProject"
  }
}

# Creating a storage container
resource "azurerm_storage_container" "blob" {
  name                     = var.container
  storage_account_id       = azurerm_storage_account.StorageAccount.id
  container_access_type    = "private"
}

# Creating a storage blob SAS 
data "azurerm_storage_account_sas" "storage_SAS" {
  connection_string        = azurerm_storage_account.StorageAccount.primary_connection_string
  https_only               = true
   start                   = timestamp()
   expiry                  = timeadd(timestamp(), "240h") # 10 days
  signed_version           = "2022-11-02"

  resource_types {
    service   = true
    container = true
    object    = true
  }

  services {
    blob   = true
    file   = false
    queue  = false
    table  = false
  }


  permissions {
    read    = true
    write   = true
    delete  = true 
    list    = true
    create  = true
    add     = true
    update  = true
    process = true
    tag     = false
    filter  = false
  }
}



