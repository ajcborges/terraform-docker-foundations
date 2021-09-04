variable "container_puid" {
  type        = number
  description = "PUID"
  default     = 1000
}

variable "container_pgid" {
  type        = number
  description = "PGID"
  default     = 1000
}

variable "container_port" {
  description = "Port for the Application"
  default     = "80"
}

variable "container_hostname_db" {
  description = "Hostname of the container."
  default     = "projectsenddb"
}

variable "projectsend_mariadb_password" {
  description = "Password for projectsend MariaDB server"
  type        = string
}

variable "container_hostname_app" {
  description = "Hostname of the container."
  default     = "projectsendapp"
}

variable "container_domainname" {
  description = "Domain name of the container.."
  default     = "cedeno.local"
}

variable "traefik_dns_label" {
  description = "label for traefik."
  default     = "filesend.cedeno.local"
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

variable "projectsenddb_cfg_default_mountpoint" {
  type        = string
  description = "here"
  default     = "/home/ajcborges/Documents/terraform-docker-foundation/containers/dck-projectsend/db"
}

variable "projectsendapp_cfg_default_mountpoint" {
  type        = string
  description = "here"
  default     = "/home/ajcborges/Documents/terraform-docker-foundation/containers/dck-projectsend/app"
}

variable "projectsendapp_dat_default_mountpoint" {
  type        = string
  description = "here"
  default     = "/home/ajcborges/Documents/terraform-docker-foundation/containers/dck-projectsend/dat"
}