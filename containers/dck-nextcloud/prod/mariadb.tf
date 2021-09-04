# Referred to https://github.com/linuxserver/docker-mariadb
# for config.
resource "docker_container" "dck-nextclouddb" {
  name                  = "dck-nextclouddb"
  image                 = docker_image.mariadb-img.latest
  restart               = "unless-stopped"
  domainname            = var.container_domainname
  hostname              = var.container_hostname_db
  destroy_grace_seconds = 30
  must_run              = true

  env = [
    "TZ=${var.TIME_ZONE}",
    "MYSQL_DATABASE=nextcloudapp",
    "MYSQL_USER=nextcloud",
    "MYSQL_ROOT_PASSWORD=${var.nextcloud_mariadb_password}",
    "MYSQL_PASSWORD=${var.nextcloud_mariadb_password}",
    "PUID=${var.container_puid}",
    "PGUID=${var.container_pgid}"
  ]

  networks_advanced {
    name = "backend-net"
  }

  volumes {
    volume_name    = "${docker_volume.nextclouddb-cfg-vol.name}"
    container_path = "/var/lib/mysql"
  }

  labels {
    label = "com.centurylinklabs.watchtower.enable"
    value = "true"
  }

}

