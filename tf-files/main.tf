# Configure the Microsoft Azure Provider
terraform {
  backend "azurerm" {
    key = "tf4\tf.state"
  }

  required_version = "0.11.14"
}
provider "azurerm" {
    # The "feature" block is required for AzureRM provider 2.x. 
    # If you're using version 1.x, the "features" block is not allowed.
    version = "1.44"
    #features {}

    subscription_id = "1e1d965b-e295-49e8-868c-6334c33ba977"
    client_id       = "bdec2fae-bff5-4fc7-b594-472ff72f436e"
    client_secret   = "68048658-fa90-4bff-94d9-7145f5a0cd1d"
    tenant_id       = "47d6c85e-dbf8-4ab2-a35b-512ac8ce5d78"
}

resource "azurerm_resource_group" "example" {
  name     = "storage-rg"
  location = "West Europe"
}

resource "azurerm_storage_account" "account" {
  name                              = "tfstorage111199"
  resource_group_name               = "${azurerm_resource_group.example.name}"
  location                          = "${azurerm_resource_group.example.location}"
  account_replication_type          = "LRS"
  account_tier                      = "Standard"
  account_kind                      = "StorageV2"
  # enable_blob_encryption            = "true"
  # enable_file_encryption            = "true"
  # enable_https_traffic_only         = "true"
  # enable_advanced_threat_protection = "true"

}
# resource "azurerm_virtual_network" "example" {
#   name                = "example-network"
#   address_space       = ["10.0.0.0/16"]
#   location            = azurerm_resource_group.example.location
#   resource_group_name = azurerm_resource_group.example.name
# }

# resource "azurerm_subnet" "example" {
#   name                 = "internal"
#   resource_group_name  = azurerm_resource_group.example.name
#   virtual_network_name = azurerm_virtual_network.example.name
#   address_prefix       = "10.0.2.0/24"
# }

# resource "azurerm_network_interface" "example" {
#   name                = "example-nic"
#   location            = azurerm_resource_group.example.location
#   resource_group_name = azurerm_resource_group.example.name

#   ip_configuration {
#     name                          = "internal"
#     subnet_id                     = azurerm_subnet.example.id
#     private_ip_address_allocation = "Dynamic"
#   }
# }

# resource "azurerm_linux_virtual_machine" "example" {
#   name                = "example-machine"
#   resource_group_name = azurerm_resource_group.example.name
#   location            = azurerm_resource_group.example.location
#   size                = "Standard_F2"
#   admin_username      = "adminuser"
#   network_interface_ids = [
#     azurerm_network_interface.example.id,
#   ]

#  # admin_ssh_key {
#  #   username   = "adminuser"
#  #   public_key = file("~/.ssh/id_rsa.pub")
#  # }

#   os_disk {
#     caching              = "ReadWrite"
#     storage_account_type = "Standard_LRS"
#   }

#   source_image_reference {
#     publisher = "Canonical"
#     offer     = "UbuntuServer"
#     sku       = "16.04-LTS"
#     version   = "latest"
#   }
# }


