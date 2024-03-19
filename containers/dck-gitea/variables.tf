variable "app_name" {
  description = " Application Name"
}

variable "app_internal_port_one" {
  description = "Internal Network Port used by the Application"
}

variable "app_external_port_one" {
  description = "External Network Port used by the Application"
}

variable "app_internal_port_two" {
  description = "Internal Network Port used by the Application"
}

variable "app_external_port_two" {
  description = "External Network Port used by the Application"
}

variable "app_domain" {
  description = "Domain Hosting the Application"
}

variable "app_hostname" {
  description = "Hostname of the Application"
}

variable "app_network_one" {
  description = "Network where the Application will be running."
}

variable "app_timezone" {
  type        = string
  description = "The timezone to be used (default: Australia/Melbourne)"
}

variable "app_default_mountpoint" {
  type        = string
  description = "here"
}

variable "db_type" {
  type        = string
  description = "here"
}

variable "app_server_ipaddress" {
  type        = string
  description = "here"
}