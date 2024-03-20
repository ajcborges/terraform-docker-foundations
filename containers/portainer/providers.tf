provider "docker" {
  //host = "ssh://ajcborges@192.168.1.121:22"
  host = "unix:///var/run/docker.sock"
}

terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = ">=3.0.2"
    }
  }
  required_version = ">= 1.3.3"
}