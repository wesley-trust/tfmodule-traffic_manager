# Create traffic manager endpoint
resource "azurerm_traffic_manager_azure_endpoint" "traffic_manager_endpoint" {
  for_each            = var.resource_traffic_manager_endpoint_type == "Azure_Endpoint" ? toset(var.resource_traffic_manager_endpoint_locations) : []
  name                = "${local.service_environment_prefix}-${replace(each.value, "/[a-z[:space:]]/", "")}-${var.service_deployment}-${var.resource_name}"
  profile_id          = azurerm_traffic_manager_profile.traffic_manager_profile.id
  target_resource_id  = var.resource_traffic_manager_endpoints[each.value].public_ip_id
  weight              = 100
}