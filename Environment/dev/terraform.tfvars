rgs = {
  rg1 = {
    name     = "demo-rg"
    location = "centralindia"
  }

}

vnets = {
  vnet1 = {
    name                = "demo-vnet"
    location            = "centralindia"
    resource_group_name = "demo-rg"
    address_space       = ["10.0.0.0/16"]
  }
}

subnets = {
  subnet1 = {
    name                 = "demo-subnet"
    resource_group_name  = "demo-rg"
    virtual_network_name = "demo-vnet"
    address_prefixes     = ["10.0.1.0/24"]
  }
}


nics = {
  nic1 = {
    name                          = "demo-nic"
    location                      = "centralindia"
    resource_group_name           = "demo-rg"
   # subnet_id                     = "/subscriptions/6c750392-d85d-41e6-a2be-4dc4ddc9d11d/resourceGroups/demo-rg/providers/Microsoft.Network/virtualNetworks/demo-vnet/subnets/demo-subnet"
    private_ip_address_allocation = "Dynamic"

    ip_configuration = {
      name                          = "ipconfig1"
      subnet_id                     = "/subscriptions/6c750392-d85d-41e6-a2be-4dc4ddc9d11d/resourceGroups/demo-rg/providers/Microsoft.Network/virtualNetworks/demo-vnet/subnets/demo-subnet"
      private_ip_address_allocation = "Dynamic"
    }
  }
}


vms = {
  "vm1" = {
    name                = "demo-vm"
    location            = "centralindia"
    resource_group_name = "demo-rg"
    size                = "Standard_D2as_v4"

    admin_username = "azureuser"
    admin_password = "AzureUser@123"
    disable_password_authentication = false

    network_interface_id = "/subscriptions/6c750392-d85d-41e6-a2be-4dc4ddc9d11d/resourceGroups/demo-rg/providers/Microsoft.Network/networkInterfaces/demo-nic"

    os_disk = {
      name                 = "demo-os-disk"
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }

    source_image_reference = {
      publisher = "Canonical"
      offer     = "UbuntuServer"
      sku       = "18.04-LTS"
      version   = "latest"
    }
  }
}
