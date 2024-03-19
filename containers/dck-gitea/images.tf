# Docker Images
#
# Docker Image for Gitea Deployment
resource "docker_image" "gitea-img" {
  name         = "gitea/gitea:latest"
  keep_locally = true
}
