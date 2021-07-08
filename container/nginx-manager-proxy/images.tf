# Docker Images
#
# Docker Image for nginx database Deployment
resource "docker_image" "nmp-db-img" {
   name                         = "jc21/mariadb-aria:latest"
   keep_locally                 = true
}
