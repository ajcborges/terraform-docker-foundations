## Service networking

# Frontend Network
resource "docker_network" "frontend-net" {
  name            = "frontend-net"
  check_duplicate = var.chk-duplicate
  driver          = var.driver 
  ipam_config {
    subnet        = var.frontend-subnet
    gateway       = var.frontend-gateway
  }
}

# Backend Network
resource "docker_network" "backend-net" {
  name            = "backend-net"
  check_duplicate = var.chk-duplicate
  driver          = var.driver
  ipam_config {
    subnet        = var.backend-subnet
    gateway       = var.backend-gateway
  }
}
