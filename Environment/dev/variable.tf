variable "rgs" {
  description = "A map of resource groups to create"
  type = map(object({
    name     = string
    location = string
  }))

}

variable "vnets" {
  description = "A map of virtual networks to create"
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
  }))
}

variable "subnets" {
  description = "A map of subnets to create"
  type = map(object({
    name                 = string
    resource_group_name  = string
    virtual_network_name = string
    address_prefixes     = list(string)
  }))
}


variable "nics" {
  description = "A map of network interfaces to create"
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
   # subnet_id           = string
    private_ip_address_allocation = string

    ip_configuration = object({
      name                          = string
      subnet_id                     = string
      private_ip_address_allocation = string
  })

    }))
}


variable "vms" {
  description = "A map of virtual machines to create"
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    size                = string

    admin_username = string
    admin_password = string
    disable_password_authentication = optional(bool, false)

    network_interface_id = string

    os_disk = object({
      name                 = string
      caching              = string
      storage_account_type = string
    })

    source_image_reference = object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    })
  }))

}


