module "resource_group" {
  source = "../../module/azurerm_rg"
  rgs    = var.rgs
}

module "virtual_network" {
  depends_on = [module.resource_group]
  source     = "../../module/azurerm_vnet"
  vnets      = var.vnets
}

module "subnet" {
  depends_on = [module.virtual_network]
  source     = "../../module/azurerm_subnet"
  subnets    = var.subnets
}

module "network_interface" {
  depends_on = [module.subnet]
  source     = "../../module/azurerm_nic"
  nics       = var.nics
  
  
}

module "virtual_machine" {
  depends_on = [module.network_interface]
  source     = "../../module/azurerm_vm"
  vms        = var.vms
}

