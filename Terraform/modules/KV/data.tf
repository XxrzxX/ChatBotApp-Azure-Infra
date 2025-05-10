# Key Vault Data 
# Retrieves information about Configuration and Subscription
data "azurerm_client_config" "current" {}
data "azurerm_subscription" "primary" {}