variable "nics" {
  description = "A map of network interfaces to create"
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
#subnet_id           = string
    private_ip_address_allocation = string

    ip_configuration = object({
      name                          = string
      subnet_id                     = string
      private_ip_address_allocation = string
  })

    }))
}