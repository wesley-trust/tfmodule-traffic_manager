module "public_ip" {
  source                         = "./dependencies"
  for_each                       = toset(var.resource_locations)
  service_deployment             = var.service_deployment
  service_environment            = var.service_environment
  resource_location              = each.value
  resource_location_zone_support = lookup(var.platform_location_az, each.value, null) > 1 ? true : false
}

module "traffic_manager" {
  depends_on                                  = [module.public_ip]
  source                                      = "../"
  service_environment                         = var.service_environment
  service_deployment                          = var.service_deployment
  service_name                                = "${var.service_name}-TM"
  service_location                            = var.service_location
  resource_name                               = local.resource_name
  resource_traffic_manager_endpoints          = module.public_ip
  resource_traffic_manager_endpoint_type      = var.resource_traffic_manager_endpoint_type
  resource_traffic_manager_endpoint_locations = var.resource_locations
}
