variable "container_port" {
  description = "Port for the Application"
  default     = "5800"
}

variable "container_hostname" {
  description = "Hostname of the container."
  default     = "dupeguru"
}

variable "container_domainname" {
  description = "Domain name of the container.."
  default     = "cedeno.local"
}

variable "traefik_dns_label" {
  description = "label for traefik."
  default     = "dupeguru.cedeno.local"
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

variable "dupeguru_cfg_default_mountpoint" {
  type        = string
  description = "here"
  default     = "/home/ajcborges/Documents/terraform-docker-foundation/containers/dck-dupeguru/config"
}

variable "dupeguru_bin_default_mountpoint" {
  type        = string
  description = "here"
  default     = "/home/ajcborges/Documents/terraform-docker-foundation/containers/dck-dupeguru/trash"
}

variable "dupeguru_dat_default_mountpoint" {
  type        = string
  description = "here"
  default     = "/home/ajcborges/Documents/terraform-docker-foundation/containers/dck-dupeguru/storage"
}
