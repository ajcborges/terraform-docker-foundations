module "container" {
  source = "git::https://github.com/ajcborges/terraform-modules.git//container?ref=d8722e8"

  image          = "ghcr.io/gethomepage/homepage:latest"
  container_name = "homepage"
  hostname       = "homepage"
  restart_policy = "unless-stopped"
  ports = [{
    external = "3000"
    internal = "3000"
    protocol = "tcp"
  }]

  host_paths = {
    "/Volumes/containers/homepage/config" = {
      container_path = "/app/config"
      read_only      = false
    },
    "/var/run/docker.sock" = {
      container_path = "/var/run/docker.sock"
      read_only      = true

    }

  }


}
