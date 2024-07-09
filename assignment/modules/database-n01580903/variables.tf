variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "db_name" {
  type    = string
  
}

variable "database_name" {
  type    = string
 
}

variable "sku_name" {
  type    = string
  default = "B_Gen5_2"
}

variable "storage_mb" {
  type    = number
  default = 5120
}

variable "backup_retention_days" {
  type    = number
  default = 7
}

variable "geo_redundant_backup_enabled" {
  type    = bool
  default = false
}

variable "auto_grow_enabled" {
  type    = bool
  default = true
}

variable "admin_username" {
  type = string
}

variable "admin_password" {
  type      = string
  sensitive = true
}

variable "postgres_version" {
  type    = string
  default = "11"
}

variable "ssl_enforcement_enabled" {
  type    = bool
  default = true
}

variable "public_network_access_enabled" {
  type    = bool
  default = true
}

