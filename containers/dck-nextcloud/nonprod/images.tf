
data "docker_registry_image" "nextcloud" {
   name          = "nextcloud"
}

resource "docker_image" "nextcloud-img" {
   name          = data.docker_registry_image.nextcloud.name
   keep_locally  = true
   pull_triggers = [data.docker_registry_image.nextcloud.sha256_digest]
}


data "docker_registry_image" "mariadb" {
   name          = "linuxserver/mariadb:latest"
}

resource "docker_image" "mariadb-img" {
   name          = data.docker_registry_image.mariadb.name
   keep_locally  = true
   pull_triggers = [data.docker_registry_image.mariadb.sha256_digest]
}