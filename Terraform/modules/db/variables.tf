#========================= Resource Group var =======================
variable "resource_group_name" {
  description = "Azure resource group name"
  type        = string
}

variable "location" {
  description = "Region location"
  type        = string
}

#=======================  Database server  =======================
variable "database_server_name" {
  description = "database server name"
  type        = string
}

variable "admin_db_username" {
  description = "Database server username"
  type        = string
}

variable "db_passowrd" {
  description = "database server password"
  type        = string
}

variable "database_name" {
  description = "database name"
  type        = string
}

#=======================  Database server FireWall Rules  =======================
variable "start_ip_address" {
  description = "start IP address for azure database firewall rules"
  type        = string
}

variable "end_ip_address" {
  description = "End IP address for azure database firewall"
  type        = string
}

variable "device_ip" {
  description = "The IP address of the development device"
  default     = null
}
