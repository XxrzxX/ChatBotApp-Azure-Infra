# Storage Account Outputs

output "storage_account_name" {
  value = azurerm_storage_account.StorageAccount.name
}

output "storage_SAS" {
  value = "${azurerm_storage_account.StorageAccount.primary_blob_endpoint}${data.azurerm_storage_account_sas.storage_SAS.sas}"
  sensitive = true
}



