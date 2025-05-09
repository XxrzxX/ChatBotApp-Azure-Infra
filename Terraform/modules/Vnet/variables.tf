#========================= Resource Group var =======================
variable "resource_group_name" {
  description = "Azure resource group name"
  type        = string
}

variable "location" {
  description = "Region location"
  type        = string
}

#=========================== Vnet var ===================================
variable "Vnet_Name" {
  description = "Name of the Virtual Network"
  type        = string
}

variable "VM_subnet" {
  description = "Name of the Subnet"
  type        = string
}

variable "VM" {
  description = "Virtual machine (VM) Name"
  type        = string
}

variable "gateway_subnet_name" {
  description = "Name of the Subnet for application subnet"
  type        = string
}

variable "BastionSubnet_name"{
  description = "Name of the Subnet for bastion host subnet"
  type        = string
}
