# Docker Volumes
#
# Docker Volume for  Container
resource "docker_volume" "monica-cfg-vol" {
  name   = "vol-monicaapp-cfg"
  driver = "local-persist"
  driver_opts = {
    "mountpoint" = var.monicaapp_cfg_default_mountpoint
  }
}

resource "docker_volume" "monicadb-cfg-vol" {
  name   = "vol-monicadb-cfg"
  driver = "local-persist"
  driver_opts = {
    "mountpoint" = var.monicadb_cfg_default_mountpoint
  }
}