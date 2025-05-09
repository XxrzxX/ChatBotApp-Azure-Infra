#========================= Subseciption var =======================
variable "subscription_id" {
  description = "The Azure Subscription ID"
  type        = string
}

#======================= Recourse group var  =======================
variable "resource_group_name" {
  description = "Azure resource group name"
  type        = string
}

variable "location" {
  description = "Region location"
  type        = string
}

#=======================  Suffix & Prefix  =======================
# These variables are used to create unique names for resources

variable "unique_suffix" {
  type = string
}

variable "unique_number" {
  type = number
}

variable "random_id" {
  type = number  
}

#=======================  Vnet module var  =======================
variable "Vnet_Name" {
  description = "Name of the Virtual Network"
  type        = string
}

variable "VM_subnet" {
  description = "Name of the Subnet for vm "
  type        = string
} 

#======================= VM module var =======================
variable "VM" {
  description = "Virtual machine (VM) Name"
  type        = string
}

variable "adminUserName" {
  description = "Username for the ssh admin key"
  type        = string
}

#======================= Storage module var =======================
variable "container" {
  description = "Container name"
  type        = string
}

#======================= DB module var =======================
variable "database_server_name" {
  description = "database server name"
  type        = string
}

variable "admin_db_username" {
  description = "Database server username"
  type        = string
}

variable "db_pass" {
  description = "database server password"
  type        = string
}

variable "database_name" {
  description = "database name"
  type        = string
}

variable "start_ip_address" {
  description = "start IP address for azure database firewall rules"
  type        = string
  default    = "0.0.0.0"
}

variable "end_ip_address" {
  description = "End IP address for azure database firewall"
  type        = string
  default     = "255.255.255.255"

}

#======================= VMSS module var =======================
variable "VMSS_name" {
  description = "Then name of the VMs Scale Set"
  type        = string
}

variable "admin_username" {
  description = "The admin username for the VMSS"
  type        = string
  sensitive = true
}

variable "source_image_id" {
  description = "The image to create VMSS"
  type        = string
  sensitive = true
}

#======================= Application Gateway module var =======================
variable "gateway_public_ip_name" {
  description = "the name of the public ip for the application gateway"
  type        = string
}

variable "gateway_name" {
  description = "the name of the application gateway"
  type        = string
}
variable "gateway_subnet_name" {
  description = "the name of the application gateway subnet"
  type        = string
  
}

#======================= Bastion host module var  =======================
variable "bh_name" {
  description = "Bastion host name"
  type        = string
}

variable "BH_ip_name" {
  description = "Name of the IP address for bastion host"
  type        = string
}

variable "BastionSubnet_name"{
  description = "Name of the Subnet for bastion host subnet"
  type        = string
}

#======================= Key vault module var =================
variable "Kv_rule" {
  description = "rule for the key vault"
  type        = string
  sensitive = true
}
variable "KvMG_rule" {
  description = "rule for the key vault"
  type        = string
  sensitive = true
}

variable "database_port" {
  description = "The port for the database"
  type        = string
  default     = "5432"
  sensitive =  true
}

variable "chromadb_port" {
  description = "The port for the database"
  type        = string
  default     = "8000"
  sensitive =  true
}
variable "OpenAi_key" {
  description = "OpenAI key secret"
  type        = string
  sensitive =  true
}

variable "kv_name" {
  description = "The name of the Key Vault"
  type        = string
}

