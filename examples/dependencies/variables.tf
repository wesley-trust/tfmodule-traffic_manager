# Required resource variables
variable "resource_name" {
  description = "Desired name for the provisioned resources"
  type        = string
  default     = "Dependency"
}

variable "service_environment" {
  description = "Desired environment for the service collection of provisioned resources"
  type        = string
}

variable "service_deployment" {
  description = "Desired deployment identifier of the service collection of provisioned resources"
  type        = string
}

variable "resource_location" {
  description = "Desired location for the provisioned resources"
  type        = string
}

variable "allocation_method" {
  description = "Allocation_method for the provisioned resources"
  type        = string
  default     = "Static"
}

variable "sku" {
  description = "SKU of IP Address"
  type        = string
  default     = "Standard"
}

variable "zones" {
  description = "Number of zones to deploy in"
  type        = list(string)
  default     = ["1", "2", "3"]
}

variable "resource_location_zone_support" {
  description = "Whether the current location supports zones"
  type        = bool
}
