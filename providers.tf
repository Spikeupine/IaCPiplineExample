terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.0.1"
      }
  }
  
  backend "azurerm" {
    resource_group_name  = "rg-terraform-backend-trygve"
    storage_account_name = "tfstatev3fkw"
    container_name       = "tfstate"
    key                  = "webexample.terraform.tfstate"
  }
}

provider "azurerm" {
  subscription_id = var.subscription_id
  features {}
}

data "terraform_remote_state" "foo" {
  backend = "azurerm"
  config = {
    resource_group_name  = "rg-terraform-backend-trygve"
    storage_account_name = "tfstatev3fkw"
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate"
  }
}