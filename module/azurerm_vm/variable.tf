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


