variable "container_hostname" {
   description		= "Hostname of the container."
   default 		   = "nmp-db"
}

variable "container_domainname" {
   description		= "Domain name of the container.."
   default 		   = ""
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
  default      = "<absolute path>/nmp-db/data"
}

variable "db_mysql" {
  type    = list(string)
  default = ["nmp-db","3306","nmp_database"]
}

variable "db_user" {
  type = string
}
variable "db_pass" {
  type = string
}

