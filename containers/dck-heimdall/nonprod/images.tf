# Docker Images
#
# Docker Image for Deployment
resource "docker_image" "heimdall-img" {
  name         = "ghcr.io/linuxserver/heimdall"
  keep_locally = true
}
