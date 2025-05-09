#========================= Resource Group var =======================
variable "resource_group_name" {
  description = "Azure resource group name"
  type        = string
}

variable "location" {
  description = "Region location"
  type        = string
}

#============================ Vnet var ================================ 
variable "subnet_id" {
  description = "Subnet Id for the VMSS"
  type        = string
}

variable "backend_pool_id" {
  description = "the backend pool assocciated wtih ip configuartion in VMSS"
  type        = string
}

#=============================  VMSS var  ================================
variable "VMSS_name" {
  description = "Then name of the VMs Scale Set"
  type        = string
}

variable "admin_username" {
  description = "The admin username for the VMSS"
  type        = string
  sensitive = true
}
#========================== IMG var =======================================
variable "source_image_id" {
  description = "The image for creating VMSS"
  type        = string
  sensitive = true
}
