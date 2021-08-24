provider "docker" {
  host = "ssh://ajcborges@192.168.1.121:22"
}

terraform {
    required_providers {
        docker = {
            source = "kreuzwerker/docker"
            #version = "2.14.0"
        }
    }
    required_version = ">= 0.13.0"
}