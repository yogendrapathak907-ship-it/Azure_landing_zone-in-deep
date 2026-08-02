
resource "azurerm_application_gateway" "appgw" {
  for_each = var.app_gateways

  name                = each.value.name
  resource_group_name = each.value.rg_name
  location            = each.value.location

  sku {
    name     = each.value.sku_name
    tier     = each.value.sku_tier
    capacity = each.value.capacity
  }

  gateway_ip_configuration {
    name      = "gateway-ip-config"
    subnet_id = data.azurerm_subnet.subnet[each.key].id
  }

  frontend_port {
    name = "frontend-port"
    port = each.value.frontend_port
  }

  frontend_ip_configuration {
    name                 = "frontend-ip"
    public_ip_address_id = data.azurerm_public_ip.public_ip[each.key].id
  }

  backend_address_pool {
    name         = each.value.backend_pool_name
    ip_addresses = each.value.backend_ip_addresses
  }

  backend_http_settings {
    name                  = each.value.http_setting_name
    cookie_based_affinity = "Disabled"
    path                  = "/"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 60
  }

  http_listener {
    name                           = each.value.listener_name
    frontend_ip_configuration_name = "frontend-ip"
    frontend_port_name             = "frontend-port"
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = each.value.routing_rule_name
    priority                   = 100
    rule_type                  = "Basic"
    http_listener_name         = each.value.listener_name
    backend_address_pool_name  = each.value.backend_pool_name
    backend_http_settings_name = each.value.http_setting_name
  }
}