# Docker Volumes
#
# Docker volume for nginx manager proxy database deployment
resource "docker_volume" "nmp-db-vol" {
   name           = "vol-nmp-db"
   driver         = "local-persist"
   driver_opts = {
     "mountpoint" = var.nmp_db_default_mountpoint
   }
}
