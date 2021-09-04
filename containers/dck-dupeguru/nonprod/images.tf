# Docker Images
#
# Docker Image for Deployment
resource "docker_image" "dupeguru-img" {
  name         = "jlesage/dupeguru"
  keep_locally = true
}
