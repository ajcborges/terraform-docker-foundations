terraform {
    required_providers {
        docker = {
            #source = "terraform-providers/docker"
            source = "kreuzwerker/docker"
            #version = "2.14.0"
        }
    }
    required_version = ">= 0.12.9"
}
