# Docker Images
#
# Docker Image for Deployment
resource "docker_image" "guacamole-img" {
  name         = "oznu/guacamole"
  keep_locally = true
}
