#========================= Suffix & Prefix  =======================
output "unique_suffix" {
  value = random_string.unique_suffix.result
  sensitive = true

}

output "unique_number" {
  value = random_integer.unique_number.result
  sensitive = true
}

#========================= VM ===============================
output "VM_public_ip_address" {
  value = module.VM.VM_public_ip_address
}

output "VM_private_ip_address" {
  value = module.VM.VM_private_ip_address
}

#========================= Vnet ===========================================#
output "device_ip" {
  value = data.external.device_ip.result.ip
}

output "gateway_public_ip_address" {
  value = module.Gateway.gateway_public_ip_address
}

output "database_host" {
  value = module.db.database_host
}

#========================= DB ===========================================#
output "database_username" {
  value = module.db.database_username
}

output "database_name" {
  value = module.db.database_name
}