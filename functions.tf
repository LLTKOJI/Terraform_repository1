resource "azurerm_service_plan" "funcion_plan" {
  name                = "plan-funcion"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Windows"
  sku_name            = "Y1"
}

resource "azurerm_storage_account" "funcion_storage" {
  name                     = "funcionstorage${random_integer.suffix.result}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "random_integer" "suffix" {
  min = 10000
  max = 99999
}

resource "azurerm_function_app" "procesador_mensajes" {
  name                       = "funcion-procesador-mensajes"
  location                   = var.location
  resource_group_name        = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_service_plan.funcion_plan.id
  storage_account_name       = azurerm_storage_account.funcion_storage.name
  storage_account_access_key = azurerm_storage_account.funcion_storage.primary_access_key
  version                    = "~4"

}