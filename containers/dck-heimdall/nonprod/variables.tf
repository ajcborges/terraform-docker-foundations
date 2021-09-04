variable "heimdall_cfg_default_mountpoint" {
  type = string
  description  = "here"
  default = "/home/ajcborges/Documents/terraform-docker-foundation/containers/dck-heimdall/config"
}

variable "container_puid" {
  type = number
  description = "PUID"
  default = 1000
}

variable "container_pgid" {
  type = number
  description = "PGID"
  default = 1000
}

variable "TIME_ZONE" {
  type = string
  description = "The timezone to be used (default: Australia/Melbourne)"
  default = "Australia/Melbourne"
}

variable "container_hostname" {
   description		= "Hostname of the container."
   default 		   = "heimdall"
}

variable "container_domainname" {
   description		= "Domain name of the container.."
   default 		   = "cedeno.local"
}

variable "container_port" {
   description		= "Port for the Application"
   default 		= "80"
}

variable "traefik_dns_label" {
   description          = "label for traefik."
   default              = "heimdall.cedeno.local"
}



