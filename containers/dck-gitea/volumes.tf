# Docker Volumes
#
# Docker Volume for Gitea Deployment
resource "docker_volume" "gitea-vol" {
  name   = "vol-gitea-data"
  driver = "local-persist"
  driver_opts = {
    "mountpoint" = var.app_default_mountpoint
  }
}

