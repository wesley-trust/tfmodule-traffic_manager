# Required service variables
variable "service_name" {
  description = "Desired name for the provisioned resources"
  type        = string
  default     = "Services"
}

variable "service_environment" {
  description = "Desired environment for the service collection of provisioned resources"
  type        = string
  default     = "Test"
}

variable "service_deployment" {
  description = "Desired deployment identifier of the service collection of provisioned resources"
  type        = string
}

variable "service_location" {
  description = "Desired location for each service environment"
  type        = string
  default     = "UK South"
}

# Required resource variables
variable "resource_name" {
  description = "Desired name for the provisioned resources"
  type        = map(string)
  default = {
    "Services" = "TST"
  }
}

variable "resource_locations" {
  description = "Traffic manager endpoint locations"
  type        = list(string)
  default     = ["UK South", "North Central US"]
}

variable "resource_traffic_manager_endpoints" {
  description = "Traffic manager endpoint public ips"
  type        = any
}

variable "resource_traffic_manager_endpoint_type" {
  description = "Type of Traffic Manager Endpoint"
  type        = string
  default     = "Azure_Endpoint"
}
