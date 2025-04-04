resource "azurerm_servicebus_namespace" "mensajeria" {
  name                = "sbmensajes${random_integer.ns_suffix.result}"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "Basic"
}

resource "azurerm_servicebus_queue" "cola_procesos" {
  name        = "cola-procesamiento"
  namespace_id = azurerm_servicebus_namespace.mensajeria.id
}

resource "random_integer" "ns_suffix" {
  min = 10000
  max = 99999
}