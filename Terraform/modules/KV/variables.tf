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
variable "unique_suffix" {
  type = string
}

variable "unique_number" {
  type = number
}

#=======================  Key vaults var  =======================
variable "kv_name" {
  description = "The name of the Key Vault"
  type        = string
}

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


variable "MG_id" {
  description = "Managed Identity id from the vmss"
  type        = string
  sensitive   = true
}

variable "database_host" {
  description = "The private IP address for the VM that run chromadb"
  type        = string
  sensitive =  true
}

variable "admin_db_username" {
  description = "Database server username"
  type        = string
   sensitive =  true
}

variable "db_pass" {
  description = "database server password"
  type        = string
   sensitive =  true
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


variable "database_name" {
  description = "database name"
  type        = string
   sensitive =  true
}

variable "storage_SAS" {
  description = "Shared access signiture url"
  type        = string
   sensitive =  true
}

variable "container" {
  description = "Container name"
  type        = string
  sensitive =  true
}

variable "VM_private_ip_address" {
  description = "The private IP address for the VM that run chromadb"
  type        = string
  sensitive =  true
}

variable "OpenAi_key" {
  description = "OpenAI key secret"
  type        = string
  sensitive =  true
}
