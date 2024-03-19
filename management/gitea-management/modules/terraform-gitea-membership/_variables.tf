variable "admins" {
  type    = set(string)
  default = []
}

variable "members" {
  type    = set(any)
  default = []
}

variable "restricted" {
  type    = set(any)
  default = []
}