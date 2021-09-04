
data "docker_registry_image" "monica" {
  name = "monica"
}

resource "docker_image" "monica-img" {
  name          = data.docker_registry_image.monica.name
  keep_locally  = true
  pull_triggers = [data.docker_registry_image.monica.sha256_digest]
}


data "docker_registry_image" "mariadb" {
  name = "linuxserver/mariadb:latest"
}

resource "docker_image" "mariadb-img" {
  name          = data.docker_registry_image.mariadb.name
  keep_locally  = true
  pull_triggers = [data.docker_registry_image.mariadb.sha256_digest]
}