variable "http_port" {
   description		= "Public HTTP port for Portainer"
   default 		= "9000"
}

variable "container_path" {
   description		= "The path where data will be storage."
   default 		   = "/home/ajcborges/Documents/terraform-docker-foundations/containers/portainer/data"
}

variable "container_hostname" {
   description		= "Hostname of the container."
   default 		   = "portainer"
}

variable "container_domainname" {
   description		= "Domain name of the container.."
   default 		   = "cedeno.me"
}
variable "network_alias" {
   description		= "The network alias for all containers"
   default		= "frontend-network"
}
variable "TIME_ZONE" {
  type = string
  description = "The timezone to be used (default: Australia/Melbourne)"
  default = "Australia/Melbourne"

#  validation {
#    condition     = length(var.TIME_ZONE) > 0
#    error_message = "Invalid TIME_ZONE specified."
#  } 
}
