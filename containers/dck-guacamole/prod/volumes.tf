# Docker Volumes
#
# Docker Volume for  Container
resource "docker_volume" "guacamole-cfg-vol" {
   name           = "vol-guacamole-cfg"
   driver         = "local-persist"
   driver_opts = {
     "mountpoint" = var.guacamole_cfg_default_mountpoint
   }
}