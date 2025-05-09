#========================= Resource Group var =======================
variable "resource_group_name" {
  description = "Azure resource group name"
  type        = string
}

variable "location" {
  description = "Region location"
  type        = string
}

#=======================  Bastion host  =======================
variable "bh_name" {
  description = "Bastion host name"
  type        = string
}

variable "BH_ip_name" {
  description = "Name of the public IP address for bastion host"
  type        = string
}

variable "BH_subnet_id" {
  description = "subnet ID for bastion host"
  type        = string
}
