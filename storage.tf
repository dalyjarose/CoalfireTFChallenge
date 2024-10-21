resource "azurerm_storage_account" "challenge_sa" {
  name                     = "challengestorageacct"
  resource_group_name       = azurerm_resource_group.rg.name
  location                  = azurerm_resource_group.rg.location
  account_tier              = "Standard"
  account_replication_type  = "LRS"
  
  network_rules {
    default_action             = "Deny"
    virtual_network_subnet_ids = [
      azurerm_subnet.sub1.id,
      azurerm_subnet.sub2.id,
      azurerm_subnet.sub3.id,
      azurerm_subnet.sub4.id,
    ]
  }
}