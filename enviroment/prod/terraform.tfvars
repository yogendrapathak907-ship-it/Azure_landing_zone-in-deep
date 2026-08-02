rgs = {
  rg1 = {
    name     = "rg-god-qa"
    location = "malaysiawest"
  }
}

vnets = {
  vnet1 = {
    name                = "vnet-god-qa"
    location            = "malaysiawest"
    resource_group_name = "rg-god-qa"
    address_space       = ["10.0.0.0/16"]
  }
}

subnets = {
  snet1 = {
    name                 = "frontend-subnet-qa"
    resource_group_name  = "rg-god-qa"
    virtual_network_name = "vnet-god-qa"
    address_prefixes     = ["10.0.1.0/24"]
  }
  snet2 = {
    name                 = "backend-subnet-qa"
    resource_group_name  = "rg-god-qa"
    virtual_network_name = "vnet-god-qa"
    address_prefixes     = ["10.0.2.0/24"]
  }
  snet3 = {
    name                 = "database-subnet-qa"
    resource_group_name  = "rg-god-qa"
    virtual_network_name = "vnet-god-qa"
    address_prefixes     = ["10.0.3.0/24"]
  }
  snet4 = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "rg-god-qa"
    virtual_network_name = "vnet-god-qa"
    address_prefixes     = ["10.0.4.0/26"]
  }
  snet5 = {
    name                 = "AppGatewaySubnet"
    resource_group_name  = "rg-god-qa"
    virtual_network_name = "vnet-god-qa"
    address_prefixes     = ["10.0.5.0/24"]
  }
}

public_ips = {
  pip_bastion = {
    public_ip_name      = "pip-bastion-qa"
    resource_group_name = "rg-god-qa"
    location            = "malaysiawest"
    allocation_method   = "Static"
  }
  pip_appgw = {
    public_ip_name      = "pip-appgw-qa"
    resource_group_name = "rg-god-qa"
    location            = "malaysiawest"
    allocation_method   = "Static"
  }
}

vms = {
  frontend_1 = {
    nic_name        = "frontend-vm-nic-1-qa"
    location        = "malaysiawest"
    rg_name         = "rg-god-qa"
    nic_subnet_name = "frontend-subnet-qa"
    nic_vnet_name   = "vnet-god-qa"
    vm_name         = "frontend-vm-1-qa"
    vm_size         = "Standard_D2s_v3"
    admin_username  = "qaopsadmin"
    key_vault_name  = "kv-god-qa-123"
    secret_name     = "admin-password"
    image_publisher = "Canonical"
    image_offer     = "0001-com-ubuntu-server-jammy"
    image_sku       = "22_04-lts"
    image_version   = "latest"
  }
  frontend_2 = {
    nic_name        = "frontend-vm-nic-2-qa"
    location        = "malaysiawest"
    rg_name         = "rg-god-qa"
    nic_subnet_name = "frontend-subnet-qa"
    nic_vnet_name   = "vnet-god-qa"
    vm_name         = "frontend-vm-2-qa"
    vm_size         = "Standard_D2s_v3"
    admin_username  = "qaopsadmin"
    key_vault_name  = "kv-god-qa-123"
    secret_name     = "admin-password"
    image_publisher = "Canonical"
    image_offer     = "0001-com-ubuntu-server-jammy"
    image_sku       = "22_04-lts"
    image_version   = "latest"
  }

}

bastions = {
  bastion1 = {
    name           = "bastion-qa"
    location       = "malaysiawest"
    rg_name        = "rg-god-qa"
    subnet_name    = "AzureBastionSubnet"
    vnet_name      = "vnet-god-qa"
    public_ip_name = "pip-bastion-qa"
  }
}

app_gateways = {
  appgw1 = {
    name                 = "appgw-qa"
    location             = "malaysiawest"
    rg_name              = "rg-god-qa"
    subnet_name          = "AppGatewaySubnet"
    vnet_name            = "vnet-god-qa"
    public_ip_name       = "pip-appgw-qa"
    sku_name             = "Standard_v2"
    sku_tier             = "Standard_v2"
    capacity             = 2
    frontend_port        = 80
    backend_pool_name    = "backendpool"
    backend_ip_addresses = ["10.0.2.4"]
    http_setting_name    = "http-setting"
    listener_name        = "listener"
    routing_rule_name    = "rule1"
  }
}

load_balancers = {
  lb1 = {
    name        = "lb-backend-qa"
    location    = "malaysiawest"
    rg_name     = "rg-god-qa"
    subnet_name = "backend-subnet-qa"
    vnet_name   = "vnet-god-qa"
  }
}

key_vaults = {
  kv1 = {
    name        = "kv-god-qa-123"
    location    = "malaysiawest"
    rg_name     = "rg-god-qa"
    secret_name = "admin-password"
  }
}