# Define resource group for resource
module "resource_group" {
  source              = "github.com/wesley-trust/tfmodule-resource_group"
  service_environment = var.service_environment
  service_name        = "${var.resource_name}-rg"
  service_location    = var.resource_location
  service_deployment  = var.service_deployment
}
