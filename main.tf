provider "azurerm" {
  subscription_id = var.suscription_id
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-${var.project}-${var.environment}"
  location = var.location

  tags = var.tags
}