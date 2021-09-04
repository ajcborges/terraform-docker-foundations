variable "container_port" {
  description = "Port for the Application"
  default     = "8080"
}

variable "container_hostname" {
  description = "Hostname of the container."
  default     = "heimdall"
}

variable "container_domainname" {
  description = "Domain name of the container.."
  default     = "cedeno.me"
}

variable "traefik_dns_label" {
  description = "label for traefik."
  default     = "heimdall.cedeno.me"
}


variable "network_alias" {
  description = "The network alias for all containers"
  default     = "frontend-network"
}
variable "TIME_ZONE" {
  type        = string
  description = "The timezone to be used (default: Australia/Melbourne)"
  default     = "Australia/Melbourne"

  #  validation {
  #    condition     = length(var.TIME_ZONE) > 0
  #    error_message = "Invalid TIME_ZONE specified."
  #  } 
}

variable "heimdall_cfg_default_mountpoint" {
  type        = string
  description = "here"
  default     = "/media/docker/containers/dck-heimdall/config"
}
