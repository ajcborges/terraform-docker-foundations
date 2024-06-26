provider "docker" {
  host = var.docker_host
}

terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = ">=3.0.2"
    }
  }
  required_version = ">= 1.3.3"

  backend "local" {

  }
}