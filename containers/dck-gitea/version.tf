#----------------------------------------------------------------------------------------------
# Providers are a logical abstraction of an upstream API.
# The Docker provider is used to interact with Docker containers and images.
# host (String) represent the Docker daemon address
#----------------------------------------------------------------------------------------------
provider "docker" {
  host = "ssh://alfredocedeno@192.168.1.131:22"
}

#----------------------------------------------------------------------------------------------
#  The required_providers block must be nested inside the top-level terraform block (which can also contain other settings).
#  source           - the global source address for the provider you intend to use, such as kreuzwerker/docker
#  version          - a version constraint specifying which subset of available provider versions the module is compatible with.
#  required_version - specifies which versions of Terraform can be used with your configuration.
#----------------------------------------------------------------------------------------------

terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.16.0"
    }
  }
  required_version = ">= 0.13"
}