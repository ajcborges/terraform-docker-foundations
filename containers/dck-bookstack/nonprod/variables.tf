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

variable "container_port" {
   description		= "Port for the Application"
   default 		= "80"
}

variable "container_hostname_db" {
   description		= "Hostname of the container."
   default 		   = "bookstackdb"
}

variable "bookstack_mariadb_password" {
   description = "Password for Bookstack MariaDB server"
   type = string
}


variable "container_hostname_app" {
   description		= "Hostname of the container."
   default 		   = "bookstackapp"
}

variable "container_domainname" {
   description		= "Domain name of the container.."
   default 		   = "cedeno.me"
}

variable "traefik_dns_label" {
   description          = "label for traefik."
   default              = "wiki.cedeno.me"
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

variable "bookstackdb_cfg_default_mountpoint" {
  type = string
  description  = "here"
  default = "/home/ajcborges/Documents/terraform-docker-foundation/containers/dck-bookstack/db/config"
}

variable "bookstackapp_cfg_default_mountpoint" {
  type = string
  description  = "here"
  default = "/home/ajcborges/Documents/terraform-docker-foundation/containers/dck-bookstack/app/config"
}