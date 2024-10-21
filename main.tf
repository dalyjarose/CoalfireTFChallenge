provider "azurerm" {
  subscription_id = "7aa42b38-3d5e-4711-b3b0-fde054e92142" # This is the subscription for my own use, demo purposes only. Your subscription ID would go here
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "challenge-rg"
  location = "Central US"  
}