module "public_ip" {
  source              = "./dependencies"
  for_each            = toset(var.resource_locations)
  resource_location   = each.value
  service_deployment  = var.service_deployment
  service_environment = var.service_environment
}

module "traffic_manager" {
  depends_on                                  = [module.public_ip]
  count                                       = var.provision_traffic_manager == true ? 1 : 0
  source                                      = "../"
  service_environment                         = var.service_environment
  service_deployment                          = var.service_deployment
  service_name                                = "${var.service_name}-TM"
  service_location                            = var.service_location
  resource_name                               = var.resource_name
  resource_traffic_manager_endpoints          = module.public_ip
  resource_traffic_manager_endpoint_type      = var.resource_traffic_manager_endpoint_type
  resource_traffic_manager_endpoint_locations = var.resource_locations
}
