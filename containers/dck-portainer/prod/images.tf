# Docker Images
#
# Docker Image for Portainer Deployment
resource "docker_image" "portainer-img" {
   name                         = "portainer/portainer-ce"
   keep_locally                 = true
}