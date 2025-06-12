terraform {
  required_version = ">= 1.6.0"

  backend "azurerm" {
    resource_group_name  = "Edvaldo"
    storage_account_name = "tfstatestoreed"
    container_name       = "tfstate"
    key                  = "teste.tfstate" # Você pode usar "${terraform.workspace}.tfstate" para cada branch
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "rg-projetoA-dev"
  location = var.location
  tags = {
    environment = "dev"
    project     = "projetoA"
  }
}