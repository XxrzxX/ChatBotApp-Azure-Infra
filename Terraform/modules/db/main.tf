resource "azurerm_postgresql_flexible_server" "dbserver" {
  name                   = var.database_server_name
  resource_group_name    = var.resource_group_name
  location               = var.location
  version                = "16"
  administrator_login    = var.admin_db_username
  administrator_password = var.db_passowrd
  storage_mb             = 32768
  sku_name               = "GP_Standard_D4s_v3"

  tags = {
    environment = "production"
    name = "SDAProject"
  }
}


resource "azurerm_postgresql_flexible_server_database" "db" {
  name      = var.database_name
  server_id = azurerm_postgresql_flexible_server.dbserver.id
  collation = "en_US.utf8"
  charset   = "UTF8"

 
  lifecycle {
    prevent_destroy = false
  }
}

resource "azurerm_postgresql_flexible_server_firewall_rule" "dbfirewall" {
  name             = local.database_server_firewall_name
  server_id        = azurerm_postgresql_flexible_server.dbserver.id
  start_ip_address = var.start_ip_address
  end_ip_address   = var.end_ip_address

  depends_on = [azurerm_postgresql_flexible_server.dbserver]

}

