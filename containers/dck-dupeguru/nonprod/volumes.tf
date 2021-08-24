# Docker Volumes
#
# Docker Volume for  Container
resource "docker_volume" "dupeguru-cfg-vol" {
   name           = "vol-dupeguru-cfg"
   driver         = "local-persist"
   driver_opts = {
     "mountpoint" = var.dupeguru_cfg_default_mountpoint
   }
}

resource "docker_volume" "dupeguru-bin-vol" {
   name           = "vol-dupeguru-bin"
   driver         = "local-persist"
   driver_opts = {
     "mountpoint" = var.dupeguru_bin_default_mountpoint
   }
}

resource "docker_volume" "dupeguru-dat-vol" {
   name           = "vol-dupeguru-dat"
   driver         = "local-persist"
   driver_opts = {
     "mountpoint" = var.dupeguru_dat_default_mountpoint
   }
}