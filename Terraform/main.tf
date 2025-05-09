#=========================Resources Group=====================================
resource "azurerm_resource_group" "RG" {
  name     = var.resource_group_name
  location = var.location
  tags = {
    name = "SDAProject"
  }
}

#========================= Suffix & Prefix  ==========================================

resource "random_string" "unique_suffix" {
   length  = 6 
   special = false 
   upper   = false 
   }

resource "random_integer" "unique_number" {
   min = 10 
   max = 50 
   }

resource "random_id" "random_id" {
  byte_length = 4
}

#=========================Modules===========================================#

#========================= Vnet ======================================#
module "Vnet" {
  source                          = "./modules/Vnet"
  location                        = var.location
  resource_group_name             = var.resource_group_name
  Vnet_Name                       = var.Vnet_Name
  VM_subnet                       = var.VM_subnet
  gateway_subnet_name             = var.gateway_subnet_name
  BastionSubnet_name              = var.BastionSubnet_name
  VM                              = var.VM

  depends_on                      = [azurerm_resource_group.RG]
  }

#========================= VM ===========================================#
module "VM" {
  source                          = "./modules/VM"
  resource_group_name             = var.resource_group_name
  location                        = var.location
  VMSubnet_id                     = module.Vnet.VMSubnet_id
  VM                              = var.VM
  adminUserName                   = var.adminUserName

  depends_on                      = [azurerm_resource_group.RG,module.Vnet]
}
#========================= Storage ===========================================#
module "storage" {
  source                          = "./modules/storage"
  resource_group_name             = var.resource_group_name
  location                        = var.location
  container                       = var.container
  random_id                       = random_id.random_id.hex

  depends_on                      = [azurerm_resource_group.RG]
}


#========================= DB ===========================================#
module "db" {
  source                           = "./modules/db"
  resource_group_name              = var.resource_group_name
  location                         = var.location
  database_server_name             = var.database_server_name
  admin_db_username                = var.admin_db_username
  db_passowrd                      = var.db_pass
  database_name                    = var.database_name
  start_ip_address                 = data.external.device_ip.result.ip
  end_ip_address                   = data.external.device_ip.result.ip 

  depends_on                       = [azurerm_resource_group.RG]
}

#========================= VMSS ===========================================#
module "VMSS" {
  source                           = "./modules/VMSS"
  resource_group_name              = var.resource_group_name
  location                         = var.location
  VMSS_name                        = var.VMSS_name
  admin_username                   = var.admin_username
  source_image_id                  = var.source_image_id
  subnet_id                        = module.Vnet.VMSubnet_id
  backend_pool_id                  = module.Gateway.backend_pool_id

  depends_on                       = [azurerm_resource_group.RG,module.Vnet]
}

#========================= Application Gateway ===========================================#
module "Gateway" {
  source                             = "./modules/Gateway"
  resource_group_name                = var.resource_group_name
  location                           = var.location
  gateway_public_ip_name             = var.gateway_public_ip_name
  gateway_name                       = var.gateway_name
  VnetName                           = module.Vnet.Vnet_name
  gateway_subnet_id                  = module.Vnet.gateway_subnet_id

  depends_on                         = [azurerm_resource_group.RG, module.Vnet]
}
#========================= BH ===========================================#
module "BH" {
  source                              = "./modules/BH"
  resource_group_name                 = var.resource_group_name
  location                            = var.location
  bh_name                             = var.bh_name
  BH_ip_name                          = var.BH_ip_name
  BH_subnet_id                        = module.Vnet.BH_subnet_id

  depends_on                          = [azurerm_resource_group.RG, module.Vnet]
}
#========================= Key Vault ===========================================#
module "KV" {
  source                              = "./modules/KV"
  resource_group_name                 = var.resource_group_name
  location                            = var.location
  kv_name                             = var.kv_name
  MG_id                               = module.VMSS.MG_id
  database_host                       = module.db.database_host
  database_name                       = var.database_name
  admin_db_username                   = var.admin_db_username
  db_pass                             = var.db_pass
  storage_SAS                         = module.storage.storage_SAS
  container                           = var.container
  VM_private_ip_address               = module.VM.VM_private_ip_address
  OpenAi_key                          = var.OpenAi_key
  KvMG_rule                           = var.KvMG_rule  
  Kv_rule                             = var.Kv_rule
  unique_number                       = var.unique_number
  unique_suffix                       = var.unique_suffix
  
  depends_on                          = [azurerm_resource_group.RG, module.VMSS,module.db,module.VM]
}