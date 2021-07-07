variable "frontend-subnet" {
  description = "Subnet for ip/mac vlan"
  type        = string
  default     = "192.168.90.0/24"
}

variable "frontend-gateway" {
  description = "Network gateway for ip/mac vlan"
  type        = string
  default     = "192.168.90.1"
}

variable "driver" {
  description = "Whether to use ipvlan or macvlan"
  type        = string
  default     = "bridge"
}

variable "chk-duplicate" {
  description = "add description"
  type        = bool
  default     = true
}

variable "backend-subnet" {
  description = "Subnet for ip/mac vlan"
  type        = string
  default     = "172.168.90.0/24"
}

variable "backend-gateway" {
  description = "Network gateway for ip/mac vlan"
  type        = string
  default     = "172.168.90.1"
}
