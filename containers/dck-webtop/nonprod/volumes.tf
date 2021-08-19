# Docker Volumes
#
# Docker Volume for  Container
resource "docker_volume" "webtop-cfg-vol" {
   name           = "vol-webtop-cfg"
   driver         = "local-persist"
   driver_opts = {
     "mountpoint" = var.webtop_cfg_default_mountpoint
   }
}