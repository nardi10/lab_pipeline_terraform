terraform {
  required_version = ">= 1.6.0"

  backend "azurerm" {
    resource_group_name  = "Edvaldo"
    storage_account_name = "tfstatestoreed"
    container_name       = "tfstate"
    key                  = "dev-1.tfstate" # Altere dinamicamente se necessário por branch
  }
}

provider "azurerm" {
  features {}

  client_id       = var.client_id
  client_secret   = var.client_secret
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
}

resource "azurerm_resource_group" "example" {
  name     = "rg-projetoA-dev"
  location = var.location
  tags = {
    environment = "dev"
    project     = "projetoA"
  }
}
