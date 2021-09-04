# Docker Volumes
#
# Docker Volume for  Container
resource "docker_volume" "projectsend-cfg-vol" {
  name   = "vol-projectsendapp-cfg"
  driver = "local-persist"
  driver_opts = {
    "mountpoint" = var.projectsendapp_cfg_default_mountpoint
  }
}

resource "docker_volume" "projectsenddb-cfg-vol" {
  name   = "vol-projectsenddb-cfg"
  driver = "local-persist"
  driver_opts = {
    "mountpoint" = var.projectsenddb_cfg_default_mountpoint
  }
}