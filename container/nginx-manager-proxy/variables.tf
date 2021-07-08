variable "container_hostname" {
   description		= "Hostname of the container."
   default 		   = "nmp-db"
}

variable "container_domainname" {
   description		= "Domain name of the container.."
   default 		   = "cedeno.me"
}

variable "TIME_ZONE" {
  type         = string
  description  = "The timezone to be used (default: Australia/Melbourne)"
  default      = "Australia/Melbourne"

}
variable "deploy_environment" {
  type         = string
  description  = "Deployment environment (dev or prod)."
}

variable "nginx_db_default_mountpoint" {
  type         = string
  description  = ""
  default      = "/home/<user>/Documents/terraform-docker-foundation/containers/nginx-nmp/data"
}

variable "db_mysql_user" {
  type         = string
  description  = "DB user"
}

variable "db_mysql_password" {
  type         = string
  description  = "DB password"
}

variable "db_mysql_name" {
  type         = string
  description  = "DB name"
  default      = "nmp"
}

variable "db_mysql_host" {
  type         = string
  description  = "DB host"
  default      = "nmp-db"
}

variable "db_mysql_port" {
  type         = number
  description  = "DB port"
  default      = 3306
}
