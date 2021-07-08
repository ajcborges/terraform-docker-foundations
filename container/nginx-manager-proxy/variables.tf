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

variables "db_mysql" {
  type = list(objects({
    db_name = string
    db_host = string
    db_port = number
    db_user = string
    db_pass = string
  }))
  default = [
    {
      db_name = "nmp-db"
      db_host = "nmp-db"
      db_port = 3306
      db_user = ""
      db_pass = ""
    }
  ]
}
