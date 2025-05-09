# Virtual Machine Scale Set (VMSS) outputs

output "MG_id" {
  value = azurerm_linux_virtual_machine_scale_set.VMSS.identity.0.principal_id
  sensitive = true
}