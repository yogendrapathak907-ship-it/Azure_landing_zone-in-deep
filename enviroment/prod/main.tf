module "resource_group" {
  source = "../../module/azurerm_resource_group"
  rgs    = var.rgs
}

module "virtual_network" {
  depends_on = [module.resource_group]
  source     = "../../module/azurerm_virtual_network"
  vnets      = var.vnets
}

module "subnets" {
  depends_on = [module.virtual_network]
  source     = "../../module/azurerm_subnet"
  subnets    = var.subnets
}

module "public_ip" {
  depends_on = [module.resource_group]
  source     = "../../module/azurerm_public_ip"
  public_ips = var.public_ips
}

module "key_vault" {
  depends_on = [module.resource_group]
  source     = "../../module/azurerm_key_vault"
  key_vaults = var.key_vaults
}

module "virtual_machines" {
  depends_on = [module.subnets, module.key_vault]
  source     = "../../module/azurerm_virtual_machine"
  vms        = var.vms
}

module "bastion" {
  depends_on = [module.subnets, module.public_ip]
  source     = "../../module/azurerm_bastion"
  bastions   = var.bastions
}

module "application_gateway" {
  depends_on   = [module.subnets, module.public_ip, module.virtual_machines]
  source       = "../../module/azurerm_application_gateway"
  app_gateways = var.app_gateways
}

module "load_balancer" {
  depends_on     = [module.subnets, module.virtual_machines]
  source         = "../../module/azurerm_load_balancer"
  load_balancers = var.load_balancers
}