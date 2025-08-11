terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.39.0"
    }
  }

}

provider "azurerm" {
    features {
    }
  subscription_id = "c316f505-7597-4175-b5db-d2949009d506"
}

resource "azurerm_resource_group" "rg" {
  name     = "ace-rg"
  location = "West Europe"

}

resource "azurerm_storage_account" "sa" {
  name                     = "acesa"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}