# Referred to https://github.com/linuxserver/docker-bookstack
# for config.
resource "docker_container" "dck-bookstackdb" {
    name                    = "dck-bookstackdb"
    image                   = docker_image.mariadb-img.latest
    restart                 = "unless-stopped"
    domainname              = var.container_domainname
    hostname                = var.container_hostname_db
    destroy_grace_seconds   = 30
    must_run                = true

    env = [
        "TZ=${var.TIME_ZONE}",
        "MYSQL_DATABASE=bookstackapp",
        "MYSQL_USER=bookstack",
        "MYSQL_PASSWORD=${var.bookstack_mariadb_password}",
        "PUID=${var.container_puid}",
        "PGUID=${var.container_pgid}"
    ]

    networks_advanced {
        name                = "backend-net"
    }

    volumes { 
        volume_name         = "${docker_volume.bookstackdb-cfg-vol.name}"
        container_path      = "/config"
    }

    labels {
        label = "com.centurylinklabs.watchtower.enable"
        value = "true"
  }

}

