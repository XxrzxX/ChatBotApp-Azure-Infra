output "VM_public_ip_address" {
  value = azurerm_linux_virtual_machine.chromadb_vm.public_ip_address
}

output "VM_private_ip_address" {
  value = azurerm_linux_virtual_machine.chromadb_vm.private_ip_address
}