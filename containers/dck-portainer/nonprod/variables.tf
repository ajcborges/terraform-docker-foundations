variable "container_port" {
  description = "port for Application"
  default     = "9000"
}

variable "container_path" {
  description = "The path where data will be storage."
  default     = "/media/docker/containers/portainer/config"
}

variable "container_hostname" {
  description = "Hostname of the container."
  default     = "portainer"
}

variable "container_domainname" {
  description = "Domain name of the container.."
  default     = "cedeno.local"
}

variable "traefik_dns_label" {
  description = "label for traefik."
  default     = "portainer.cedeno.local"
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