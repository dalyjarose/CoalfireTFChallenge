resource "azurerm_public_ip" "challenge_public_ip" {
  name                = "challenge-public-ip"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_lb" "challenge_lb" {
  name                = "challenge-lb"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.challenge_public_ip.id
  }
}

resource "azurerm_lb_backend_address_pool" "challenge_bap" {
  loadbalancer_id = azurerm_lb.challenge_lb.id
  name            = "BackendAddressPool"
}

resource "azurerm_lb_rule" "challenge_lb_rule" {
  name                           = "challenge_lb_rule"
  loadbalancer_id                = azurerm_lb.challenge_lb.id
  frontend_ip_configuration_name = azurerm_lb.challenge_lb.frontend_ip_configuration.0.name
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
}
