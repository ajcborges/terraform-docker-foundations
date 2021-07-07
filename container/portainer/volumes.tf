# Docker Volumes
#
# Docker Volume for Portainer Deployment
resource "docker_volume" "portainer-vol" {
   name                         = "vol-portainer-data"
}
