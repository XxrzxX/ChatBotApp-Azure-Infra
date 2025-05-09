# Virtual Machine Scale Set (VMSS) module


# This module creates a Virtual Machine Scale Set (VMSS) Configuration
resource "azurerm_linux_virtual_machine_scale_set" "VMSS" {
  name                   = var.VMSS_name
  resource_group_name    = var.resource_group_name
  location               = var.location
  sku                    = "Standard_B1s"
  instances              = 2
  admin_username         = var.admin_username
  source_image_id = var.source_image_id


  admin_ssh_key {
    username             = var.admin_username
    public_key           = file("${path.module}/../../SSHKeys/VMSS.pub")
  }


  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }


  network_interface {
    name    = "network_interface"
    primary = true


    ip_configuration {
      name                                         = "internal-primary"
      primary                                      = true
      subnet_id                                    = var.subnet_id
      application_gateway_backend_address_pool_ids = [var.backend_pool_id]
    }
  }
  custom_data           = base64encode(file("${path.module}/../../Setup_Scripts/Conda_setup.sh"))
  secure_boot_enabled   = true
  upgrade_mode          = "Automatic"

  identity {
    type = "SystemAssigned"
  }
  

  tags = {
    environment = "production"
    name = "SDAProject"
  }

}
