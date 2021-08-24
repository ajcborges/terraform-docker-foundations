# Referred to https://github.com/linuxserver/docker-mariadb
# for config.
resource "docker_container" "dck-monicadb" {
    name                    = "dck-monicadb"
    image                   = docker_image.mariadb-img.latest
    restart                 = "unless-stopped"
    domainname              = var.container_domainname
    hostname                = var.container_hostname_db
    destroy_grace_seconds   = 30
    must_run                = true

    env = [
        "TZ=${var.TIME_ZONE}",
        "MYSQL_DATABASE=monicaapp",
        "MYSQL_USER=homestead",
        "MYSQL_RANDOM_ROOT_PASSWORD=true",
        "MYSQL_PASSWORD=${var.monica_mariadb_password}",
        "PUID=${var.container_puid}",
        "PGUID=${var.container_pgid}"
    ]

    networks_advanced {
        name                = "backend-net"
    }

    volumes { 
        volume_name         = "${docker_volume.monicadb-cfg-vol.name}"
        container_path      = "/var/lib/mysql"
    }

    volumes {
        container_path      = "/etc/timezone"
        host_path           = "/etc/timezone"
        read_only           = true
    }
    
    labels {
        label = "com.centurylinklabs.watchtower.enable"
        value = "true"
  }

}

