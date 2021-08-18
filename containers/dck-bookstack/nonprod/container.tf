# Referred to https://github.com/linuxserver/docker-bookstack
# for config.
resource "docker_container" "dck-bookstackapp" {
    name                    = "dck-bookstackapp"
    image                   = docker_image.bookstack-img.latest
    restart                 = "unless-stopped"
    domainname              = var.container_domainname
    hostname                = var.container_hostname_app
    destroy_grace_seconds   = 30
    must_run                = true


    env = [
        "TZ=${var.TIME_ZONE}",
        "DB_HOST=bookstackdb",
        "DB_USER=bookstack",
        "DB_PASS=${var.bookstack_mariadb_password}",
        "DB_DATABASE=bookstackapp",
        "PUID=${var.container_puid}",
        "PGUID=${var.container_pgid}",
        "APP_URL=https://wiki.cedeno.me"
    ]

    networks_advanced {
        name                = "frontend-net"
    }

    networks_advanced {
        name                = "backend-net"
    }

    volumes {
        volume_name         = "${docker_volume.bookstackapp-cfg-vol.name}"
        container_path      = "/config"
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
        label = "traefik.http.routers.bookstackapp.entrypoints"
        value = "http"
  }

  labels {
        label = "traefik.http.routers.bookstackapp.rule"
        value = "Host(`${var.traefik_dns_label}`)"
  }

  labels {
        label = "traefik.http.middlewares.bookstackapp-https-redirect.redirectscheme.scheme"
        value = "https"
  }

  labels {
        label = "traefik.http.routers.bookstackapp.middlewares"
        value = "bookstackapp-https-redirect"
  }

  labels {
        label = "traefik.http.routers.bookstackapp-secure.entrypoints"
        value = "https"
  }

  labels {
        label = "traefik.http.routers.bookstackapp-secure.rule"
        value = "Host(`${var.traefik_dns_label}`)"
  }

  labels {
        label = "traefik.http.routers.bookstackapp-secure.tls"
        value = "true"
  }

  labels {
        label = "traefik.http.routers.bookstackapp-secure.service"
        value = "${var.container_hostname_app}"
  }

  labels {
        label = "traefik.http.services.bookstackapp.loadbalancer.server.port"
        value = "${var.container_port}"
  }

  labels {
        label = "traefik.http.routers.bookstackapp-secure.middlewares"
        value = "authelia@docker"
  }

  labels {
        label = "traefik.docker.network"
        value = "frontend-net"
  }

}