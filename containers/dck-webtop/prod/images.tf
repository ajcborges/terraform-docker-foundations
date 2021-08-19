# Docker Images
#
# Docker Image for Deployment
resource "docker_image" "webtop-img" {
   name                         = "ghcr.io/linuxserver/webtop:ubuntu-mate"
   keep_locally                 = true
}
