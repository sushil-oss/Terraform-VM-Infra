terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.57.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
    features {}
    subscription_id = "99a2d563-027d-4106-9794-b39cdcc42ba6"
}
