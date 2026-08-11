terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.100"
    }
  }
}

provider "azurerm" {
  features {}  
  subscription_id = var.subscription_id  # opcional, se não usar `az login` com sub default
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location

  tags = var.tags
}

resource "azurerm_storage_account" "storage" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location

  account_tier             = "Standard"
  account_replication_type = "LRS"     # LRS, GRS, ZRS, etc.
  account_kind             = "StorageV2"

  # Habilita ADLS Gen2 (namespace hierárquico).
  # Remova esta linha se quiser uma Storage Account tradicional (blob simples).
  is_hns_enabled = true

  min_tls_version           = "TLS1_2"
  allow_nested_items_to_be_public = false

  tags = var.tags
}

# Exemplo opcional: criando um container/filesystem dentro da storage,
# útil se você for usar como camada Bronze de um pipeline Databricks.
resource "azurerm_storage_container" "bronze" {
  name                  = "bronze"
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = "private"
}

# ---------- Containers Medallion ----------
resource "azurerm_storage_container" "silver" {
  name                  = "silver"
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = "private"
}

resource "azurerm_storage_container" "gold" {
  name                  = "gold"
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = "private"
}

resource "azurerm_storage_container" "test" {
  name                  = "test"
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = "private"
}
