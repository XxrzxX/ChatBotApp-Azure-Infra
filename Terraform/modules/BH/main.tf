# This module creates a Bastion Host in Azure.
# publlic ip 
resource "azurerm_public_ip" "BH_ip" {
  name                = var.BH_ip_name
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"

  tags = {
    environment = "production"
    name = "SDAProject"
  }
}

# Bastion Host 
resource "azurerm_bastion_host" "bastion_host" {
  name                = var.bh_name
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                 = "config"
    subnet_id            = var.BH_subnet_id
    public_ip_address_id = azurerm_public_ip.BH_ip.id
  }
  
  tags = {
    environment = "production"
    name = "SDAProject"
  }
}