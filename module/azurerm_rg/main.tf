resource "azurerm_resource_group" "rg0" {
    for_each = var.rgs
    name = each.value.name
    location = each.value.location
  
}