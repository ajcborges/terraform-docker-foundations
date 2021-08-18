# Docker Volumes
#
# Docker Volume for  Container
resource "docker_volume" "bookstackapp-cfg-vol" {
   name             = "vol-bookstackapp-cfg"
   driver           = "local-persist"
   driver_opts      = {
     "mountpoint"   = var.bookstackapp_cfg_default_mountpoint
   }
}

resource "docker_volume" "bookstackdb-cfg-vol" {
   name             = "vol-bookstackdb-cfg"
   driver           = "local-persist"
   driver_opts      = {
     "mountpoint"   = var.bookstackdb_cfg_default_mountpoint
   }
}