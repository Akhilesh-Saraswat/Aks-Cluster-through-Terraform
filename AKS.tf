terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.32.0"
    }
  }
}
provider "azurerm" {
  features {}
  subscription_id = "799b8ac2-95c2-49ae-bf18-9a3bf3936b19"

}
resource "azurerm_resource_group" "Akhilesh_rg" {
  name     = "Akhilesh_rg"
  location = "Central India"

}
resource "azurerm_kubernetes_cluster" "aks_Akhi" {
  name                = "aks-Akhilesh"
  location            = azurerm_resource_group.Akhilesh_rg.location
  resource_group_name = azurerm_resource_group.Akhilesh_rg.name
  dns_prefix          = "dns-Akhilesh"

  default_node_pool {
    name       = "userpool"
    node_count = 1
    vm_size    = "Standard_A2_v2"
  }

  identity {
    type = "SystemAssigned"
  }



}