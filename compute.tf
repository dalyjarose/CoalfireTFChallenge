resource "azurerm_availability_set" "challenge_avset" {
  name                = "challenge-avset"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  managed             = true
}

resource "azurerm_network_interface" "nic1" {
  name                = "nic1"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  ip_configuration {
    name                          = "Ipconfiguration3"
    subnet_id                     = azurerm_subnet.sub1.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface" "nic2" {
  name                = "nic2"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  ip_configuration {
    name                          = "Ipconfiguration3"
    subnet_id                     = azurerm_subnet.sub1.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface" "nic3" {
  name                = "nic3"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  ip_configuration {
    name                          = "Ipconfiguration3"
    subnet_id                     = azurerm_subnet.sub3.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "vm1" {
  name                            = "vm1"
  resource_group_name             = azurerm_resource_group.rg.name
  location                        = azurerm_resource_group.rg.location
  size                            = "Standard_DS1_v2"
  availability_set_id             = azurerm_availability_set.challenge_avset.id
  admin_username                  = "adminuser"
  admin_password                  = "P@ssw0rd123!"
  disable_password_authentication = false

  network_interface_ids = [
    azurerm_network_interface.nic1.id,
  ]

  os_disk {
    name                 = "vm1-osdisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    disk_size_gb         = 256
  }

  source_image_reference {
    publisher = "RedHat"
    offer     = "RHEL"
    sku       = "8-lvm-gen2"
    version   = "latest"
  }

  admin_ssh_key {
    username   = "azureuser"
    public_key = file("vm_id_2024.pub") # Path to your public SSH key
  }
}
resource "azurerm_linux_virtual_machine" "vm2" {
  name                            = "vm2"
  resource_group_name             = azurerm_resource_group.rg.name
  location                        = azurerm_resource_group.rg.location
  size                            = "Standard_DS1_v2"
  availability_set_id             = azurerm_availability_set.challenge_avset.id
  admin_username                  = "adminuser"
  admin_password                  = "P@ssw0rd123!"
  disable_password_authentication = false

  network_interface_ids = [
    azurerm_network_interface.nic2.id,
  ]

  os_disk {
    name                 = "vm2-osdisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    disk_size_gb         = 256
  }

  source_image_reference {
    publisher = "RedHat"
    offer     = "RHEL"
    sku       = "8-lvm-gen2"
    version   = "latest"
  }
  admin_ssh_key {
    username   = "azureuser"
    public_key = file("vm_id_2024.pub") # Path to your public SSH key
  }
}

resource "azurerm_linux_virtual_machine" "vm3" {
  name                            = "vm3"
  resource_group_name             = azurerm_resource_group.rg.name
  location                        = azurerm_resource_group.rg.location
  size                            = "Standard_DS1_v2"
  admin_username                  = "adminuser"
  admin_password                  = "P@ssw0rd123!"
  disable_password_authentication = false

  network_interface_ids = [
    azurerm_network_interface.nic3.id,
  ]

  os_disk {
    name                 = "vm3-osdisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    disk_size_gb         = 64
  }

  source_image_reference {
    publisher = "RedHat"
    offer     = "RHEL"
    sku       = "8-lvm-gen2"
    version   = "latest"
  }

  custom_data = filebase64("bootstrap.sh")
  admin_ssh_key {
    username   = "azureuser"
    public_key = file("vm_id_2024.pub") # Path to your public SSH key
  }
}

