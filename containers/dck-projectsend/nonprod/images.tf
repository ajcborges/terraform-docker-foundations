
data "docker_registry_image" "projectsend" {
   name          = "linuxserver/projectsend"
}

resource "docker_image" "projectsend-img" {
   name          = data.docker_registry_image.projectsend.name
   keep_locally  = true
   pull_triggers = [data.docker_registry_image.projectsend.sha256_digest]
}


data "docker_registry_image" "mariadb" {
   name          = "linuxserver/mariadb:latest"
}

resource "docker_image" "mariadb-img" {
   name          = data.docker_registry_image.mariadb.name
   keep_locally  = true
   pull_triggers = [data.docker_registry_image.mariadb.sha256_digest]
}