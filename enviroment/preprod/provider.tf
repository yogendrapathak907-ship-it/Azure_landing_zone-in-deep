terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.80.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-demo"
    storage_account_name = "sttfstate19082026"
    container_name       = "tfstate2"
    key                  = "preprod.tfstate"
  }
}

provider "azurerm" {
  features {}
}