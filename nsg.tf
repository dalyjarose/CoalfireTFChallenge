resource "azurerm_network_security_group" "nsg_1" {
  name                = "nsg-1"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  security_rule {
    name                       = "Allow-SSH-Internal"
    priority                   = 1000
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "10.0.0.0/16"
    destination_address_prefix = "10.0.0.0/16"
  }
}

resource "azurerm_network_security_group" "nsg_3" {
  name                = "nsg-3"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  security_rule {
    name                       = "Allow-Traffic-Internal"
    priority                   = 1000
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "10.0.0.0/16"
    destination_address_prefix = "10.0.0.0/16"
  }
}

# Associate NSG with the first subnet
resource "azurerm_subnet_network_security_group_association" "first_subnet_nsg_association" {
  subnet_id                 = azurerm_subnet.sub1.id
  network_security_group_id = azurerm_network_security_group.nsg_1.id
}

# Associate NSG with the third subnet
resource "azurerm_subnet_network_security_group_association" "third_subnet_nsg_association" {
  subnet_id                 = azurerm_subnet.sub2.id
  network_security_group_id = azurerm_network_security_group.nsg_3.id
}