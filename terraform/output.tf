output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "storage_account_name" {
  value = azurerm_storage_account.storage.name
}

output "storage_account_primary_connection_string" {
  value     = azurerm_storage_account.storage.primary_connection_string
  sensitive = true
}

output "storage_account_primary_dfs_endpoint" {
  description = "Endpoint ABFSS para uso com Databricks/Spark"
  value       = azurerm_storage_account.storage.primary_dfs_endpoint
}
