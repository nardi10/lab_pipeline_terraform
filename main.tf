# Estrutura de um projeto Terraform com ambientes isolados por branch

# Exemplo: main.tf para branch 'dev' do Projeto A

terraform {
  required_version = ">= 1.6.0"

  backend "azurerm" {
    resource_group_name  = "Edvaldo"
    storage_account_name = "tfstatestoreed"
    container_name       = "tfstate"
    key                  = "dev.tfstate"
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "rg-projetoA-dev"
  location = "East US"
  tags = {
    environment = "dev"
    project     = "projetoA"
  }
}

# arquivo opcional: variables.tf
variable "location" {
  type    = string
  default = "East US"
}
