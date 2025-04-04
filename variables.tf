variable "suscription_id" {
  type        = string
  description = "ID de la suscripción de Azure"
}

variable "admin_sql_password" {
  type        = string
  description = "Contraseña del administrador de la base de datos"
}

variable "project" {
  type        = string
  description = "Nombre del proyecto o solución"
  default     = "solution1"
}

variable "environment" {
  type        = string
  description = "Entorno de los recursos"
  default     = "dev"
}

variable "location" {
  type        = string
  description = "Ubicación geográfica de los recursos"
  default     = "East US"
}

variable "tags" {
  type        = map(string)
  description = "Etiquetas para los recursos"
  default = {
    environment = "dev"
    date        = "2025-03-28"
    owner       = "Gerson y Cristopher"
    createdBy   = "Terraform"
  }
}

variable "resource_group_name" {
  type        = string
  description = "Nombre del grupo de recursos"
  default     = "repositorio1"
}
