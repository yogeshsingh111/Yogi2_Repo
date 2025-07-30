module "rg" {
  source              = "./Module/resource_group"
  resource_group_name = var.resource_group_name
  location            = var.location

}

module "sa" {
    source = "./Module/storage_account"
  depends_on = [ module.rg ]
  storage_name = var.storage_name
  location = var.location
  resource_group_name = var.resource_group_name
}

module "vnet" {
  source                = "./module/virtual_network"
  depends_on = [ module.rg ]
  vnet_name                  = var.vnet_name
  location              = var.location
  resource_group_name   = var.resource_group_name
  subnet_name           = var.subnet_name
  address_space = var.address_space
  subnet_address_prefix = var.address_prefix
}

module "vm" {
  source              = "./Module/virtual_machine"
  depends_on = [ module.vnet ]
  vm_name             = var.vm_name
  location            = var.location
  resource_group_name = var.resource_group_name
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  subnet_id           = module.vnet.subnet_id
}