variable "resource_group_name" {
  description = "Nome do Resource Group"
  type        = string
  default     = "rg-datalake-dev"
}

variable "location" {
  description = "Região Azure"
  type        = string
  default     = "brazilsouth"
}

variable "storage_account_name" {
  description = "Nome da Storage Account (globalmente único, só letras minúsculas e números, 3-24 chars)"
  type        = string
  default     = "stdatalakedev001"
}

variable "tags" {
  description = "Tags padrão dos recursos"
  type        = map(string)
  default = {
    ambiente = "dev"
    projeto  = "datalake-inep"
  }
}

variable "subscription_id" {
  description = "ID da subscritption alvo dos scripts"
  type = string
}
