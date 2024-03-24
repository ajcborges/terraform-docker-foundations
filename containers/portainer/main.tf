module "container" {
  #source = "./modules"
  source = "git::https://github.com/ajcborges/terraform-modules.git//container?ref=d8722e8"

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
