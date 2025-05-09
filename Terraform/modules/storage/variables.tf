#========================= Resource Group var =======================
variable "resource_group_name" {
  description = "Azure resource group name"
  type        = string
}

variable "location" {
  description = "Region location"
  type        = string
}

#=======================  Suffix & Prefix  =======================
variable "random_id" {
  description = "Random ID for storage account"
  type        = number
  
}

#=======================  Storage Account var =======================
variable "container" {
  description = "Container name"
  type        = string
}
