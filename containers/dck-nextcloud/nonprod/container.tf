# Referred to https://github.com/linuxserver/docker-bookstack
# for config.
resource "docker_container" "dck-nexcloudapp" {
    name                    = "dck-nexcloudapp"
    image                   = docker_image.nextcloud-img.latest
    restart                 = "unless-stopped"
    domainname              = var.container_domainname
    hostname                = var.container_hostname_app
    destroy_grace_seconds   = 30
    must_run                = true


    env = [
        "TZ=${var.TIME_ZONE}",
        "MYSQL_HOST=nextclouddb",
        "MYSQL_USER=nextcloud",
        "MYSQL_PASSWORD=${var.nextcloud_mariadb_password}",
        "MYSQL_DATABASE=nextcloudapp",
        "PUID=${var.container_puid}",
        "PGUID=${var.container_pgid}",
    ]

    networks_advanced {
        name                = "frontend-net"
    }

    networks_advanced {
        name                = "backend-net"
    }

    volumes { 
        volume_name         = "${docker_volume.nextcloudapp-cfg-vol.name}"
        container_path      = "/var/www/html"
    }

  labels {
        label = "com.centurylinklabs.watchtower.enable"
        value = "true"
  }

  labels {
        label = "traefik.enable"
        value = "true"
  }

  labels {
        label = "traefik.http.routers.nextcloudapp.entrypoints"
        value = "http"
  } 

  labels {
        label = "traefik.http.routers.nextcloudapp.rule"
        value = "Host(`${var.traefik_dns_label}`)"
  }

  labels {
        label = "traefik.http.middlewares.nextcloudapp-https-redirect.redirectscheme.scheme"
        value = "https"
  }

  labels {
        label = "traefik.http.routers.nextcloudapp.middlewares"
        value = "nextcloudapp-https-redirect"
  }
  
  labels {
        label = "traefik.http.routers.nextcloudapp-secure.entrypoints"
        value = "https"
  }

  labels {
        label = "traefik.http.routers.nextcloudapp-secure.rule"
        value = "Host(`${var.traefik_dns_label}`)"
  }

  labels {
        label = "traefik.http.routers.nextcloudapp-secure.tls"
        value = "true"
  }

  labels {
        label = "traefik.http.routers.nextcloudapp-secure.service"
        value = "${var.container_hostname_app}"
  }

  labels {
        label = "traefik.http.services.nextcloudapp.loadbalancer.server.port"
        value = "${var.container_port}"
  }

  labels {
        label = "traefik.http.routers.nextcloudapp-secure.middlewares"
        value = "authelia@docker"
  }

  labels {
        label = "traefik.docker.network"
        value = "frontend-net"
  }

}

