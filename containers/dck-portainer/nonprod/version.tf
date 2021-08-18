provider "docker" {

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