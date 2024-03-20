module "container" {
  source = "./modules"

  image          = "portainer/portainer-ce"
  container_name = "portainer"
  hostname       = "portainer-srv"
  restart_policy = "always"
  ports = [{
    external = "9443"
    internal = "9443"
    protocol = "tcp"
  }]

  named_volumes = {
    "portainer_data" = {
      container_path = "/opt/portainer/data"
      read_only      = false
      create         = true
    }
  }

  host_paths = {
    "/Users/alfredocedeno/Documents/devops-2.0/git-repos/terraform-docker-foundations/containers/portainer/data/" = {
      container_path = "/opt/portainer/"
      read_only      = false
    }
  }


}


# module "docker" {
#   source = "../.."

#   image             = var.image
#   container_name    = var.container_name
#   hostname          = var.hostname
#   restart_policy    = var.restart_policy
#   working_dir       = var.working_dir
#   privileged        = var.privileged
#   network_mode      = var.network_mode
#   dns               = var.dns
#   entrypoint        = var.entrypoint
#   command           = var.command
#   capabilities      = var.capabilities
#   environment       = var.environment
#   docker_networks   = var.docker_networks
#   ports             = var.ports
#   named_volumes     = var.named_volumes
#   host_paths        = var.host_paths
#   devices           = var.devices
#   networks_advanced = var.networks_advanced
# }