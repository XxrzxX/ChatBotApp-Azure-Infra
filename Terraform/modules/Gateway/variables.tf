#========================= Resource Group var =======================
variable "resource_group_name" {
  description = "Azure resource group name"
  type        = string
}

variable "location" {
  description = "Region location"
  type        = string
}

#=======================  Virtual Network var  =======================
variable "VnetName" {
  description = "Name of the Virtual Network"
  type        = string
}

#=======================  Application Gateway var  =======================
variable "gateway_subnet_id" {
  description = "The id of the subnet for application gateway"
  type        = string
}

variable "gateway_public_ip_name" {
  description = "the name of the public ip for application gateway"
  type        = string
}

variable "gateway_name" {
  description = "the name of the application gateway"
  type        = string
}

