resource "azurerm_resource_group" "rg" {
  name     = "terraform-rg-${terraform.workspace}"
  location = var.azure_location
}

resource "azurerm_virtual_network" "vnet" {
  name                = "terraform-vnet-${terraform.workspace}"
  address_space       = ["10.0.0.0/16"]
  location            = var.azure_location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "subnet" {
  name                 = "terraform-subnet-${terraform.workspace}"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_public_ip" "ip" {
  name                = "terraform-public-ip-${terraform.workspace}"
  location            = var.azure_location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"
}

resource "azurerm_network_security_group" "nsg" {
  name                = "terraform-nsg-${terraform.workspace}"
  location            = var.azure_location
  resource_group_name = azurerm_resource_group.rg.name

  security_rule {
    name                       = "allow-web"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_ranges    = ["22", "80", "443"]
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_interface" "nic" {
  name                = "terraform-nic"
  location            = var.azure_location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.ip.id
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                = "terraform-vm"
  location            = var.azure_location
  resource_group_name = azurerm_resource_group.rg.name
  size                = "Standard_B1s"

  admin_username = local.azure_username

  network_interface_ids = [
    azurerm_network_interface.nic.id
  ]

  admin_ssh_key {
    username   = local.azure_username
    public_key =  file("~/.ssh/azure_key.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "ubuntu-24_04-lts"
    sku       = "server"
    version   = "latest"
  }
}