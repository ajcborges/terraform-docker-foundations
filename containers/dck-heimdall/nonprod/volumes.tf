# Docker Volumes
#
# Docker Volume for  Container
resource "docker_volume" "heimdall-cfg-vol" {
   name           = "vol-heimdall-cfg"
   driver         = "local-persist"
   driver_opts = {
     "mountpoint" = var.heimdall_cfg_default_mountpoint
   }
}