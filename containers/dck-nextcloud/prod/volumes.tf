# Docker Volumes
#
# Docker Volume for  Container
resource "docker_volume" "nextcloudapp-cfg-vol" {
   name           = "vol-nextcloudapp-cfg"
   driver         = "local-persist"
   driver_opts = {
     "mountpoint" = var.nextcloudapp_cfg_default_mountpoint
   }
}

resource "docker_volume" "nextclouddb-cfg-vol" {
   name           = "vol-nextclouddb-cfg"
   driver         = "local-persist"
   driver_opts = {
     "mountpoint" = var.nextclouddb_cfg_default_mountpoint
   }
}