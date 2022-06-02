resource "azurerm_public_ip" "public_ip" {
  name                = "${var.resource_name}-ip"
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  allocation_method   = var.allocation_method
  sku                 = var.sku
  zones               = var.zones
  domain_name_label   = local.resource_public_ip_domain_name_label
}