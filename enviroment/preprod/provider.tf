terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.80.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg_god"
    storage_account_name = "mygodstorage"
    container_name       = "mygodcontainer"
    key                  = "preprod.tfstate"
  }
}

provider "azurerm" {
  features {}
}