terraform {
  backend "azurerm" {
    resource_group_name  = "rg-tfstate"
    storage_account_name = "sttfstateinep001"
    container_name       = "tfstate"
    key                  = "datalake-inep.dev.tfstate"
  }
}
