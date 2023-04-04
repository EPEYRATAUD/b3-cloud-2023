terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "node_group" {
  name     = "node_group-resource-group"
  location = "eastus"
}

resource "azurerm_network_interface" "node1-nic" {
  name                = "node1-nic"
  location            = azurerm_resource_group.node_group.location
  resource_group_name = azurerm_resource_group.node_group.name

  ip_configuration {
    name                          = "node1-ip"
    subnet_id                     = azurerm_subnet.s-b3_node.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.node1-public-ip.id
  }
}

resource "azurerm_public_ip" "node1-public-ip" {
  name                = "node1-public-ip"
  location            = azurerm_resource_group.node_group.location
  resource_group_name = azurerm_resource_group.node_group.name
  allocation_method   = "Dynamic"
}

resource "azurerm_network_interface" "node2-nic" {
  name                = "node2-nic"
  location            = azurerm_resource_group.node_group.location
  resource_group_name = azurerm_resource_group.node_group.name

  ip_configuration {
    name                          = "node2-ip"
    subnet_id                     = azurerm_subnet.s-b3_node.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_subnet" "s-b3_node" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.node_group.name
  virtual_network_name = azurerm_virtual_network.vn-node_group.name
  address_prefixes     = ["10.0.3.0/24"]
}

resource "azurerm_virtual_network" "vn-node_group" {
  name                = "vn-node_group"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.node_group.location
  resource_group_name = azurerm_resource_group.node_group.name
}

resource "azurerm_linux_virtual_machine" "node1" {
  name                = "node1"
  location            = azurerm_resource_group.node_group.location
  resource_group_name = azurerm_resource_group.node_group.name
  size                = "Standard_B1s"
  admin_username      = "targa"
  admin_ssh_key {
    username   = "targa"
    public_key = file("id_rsa.pub")
  }

  network_interface_ids = [
    azurerm_network_interface.node1-nic.id
  ]
  os_disk {
    name              = "node1-osdisk"
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}

resource "azurerm_linux_virtual_machine" "node2" {
  name                = "node2"
  location            = azurerm_resource_group.node_group.location
  resource_group_name = azurerm_resource_group.node_group.name
  size                = "Standard_B1s"
  admin_username      = "targa"
  admin_ssh_key {
    username   = "targa"
    public_key = file("id_rsa.pub")
  }

  network_interface_ids = [
    azurerm_network_interface.node2-nic.id
  ]
  os_disk {
    name              = "node2-osdisk"
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  
  source_image_reference {
    publisher = "Debian"
    offer     = "debian-10"
    sku       = "10"
    version   = "latest"
  }
}

