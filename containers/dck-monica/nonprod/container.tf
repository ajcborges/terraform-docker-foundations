# Referred to https://github.com/linuxserver/docker-bookstack
# for config.
resource "docker_container" "dck-monicaapp" {
    name                    = "dck-monicaapp"
    image                   = docker_image.monica-img.latest
    restart                 = "unless-stopped"
    domainname              = var.container_domainname
    hostname                = var.container_hostname_app
    destroy_grace_seconds   = 30
    must_run                = true


    env = [
        "TZ=${var.TIME_ZONE}",
        "DB_HOST=monicadb",
        "PUID=${var.container_puid}",
        "PGUID=${var.container_pgid}"
        "APP_KEY=MiHe3JFtqFwnFaLC2X8tUzXsk56ExAKD"
    ]

    networks_advanced {
        name                = "frontend-net"
    }

    networks_advanced {
        name                = "backend-net"
    }

    volumes { 
        volume_name         = "${docker_volume.monicaapp-cfg-vol.name}"
        container_path      = "/var/www/html/storage"
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

  labels {
        label = "traefik.enable"
        value = "true"
  }

  labels {
        label = "traefik.http.routers.monicaapp.entrypoints"
        value = "http"
  } 

  labels {
        label = "traefik.http.routers.monicaapp.rule"
        value = "Host(`${var.traefik_dns_label}`)"
  }

  labels {
        label = "traefik.http.middlewares.monicaapp-https-redirect.redirectscheme.scheme"
        value = "https"
  }

  labels {
        label = "traefik.http.routers.monicaapp.middlewares"
        value = "monicaapp-https-redirect"
  }
  
  labels {
        label = "traefik.http.routers.monicaapp-secure.entrypoints"
        value = "https"
  }

  labels {
        label = "traefik.http.routers.monicaapp-secure.rule"
        value = "Host(`${var.traefik_dns_label}`)"
  }

  labels {
        label = "traefik.http.routers.monicaapp-secure.tls"
        value = "true"
  }

  labels {
        label = "traefik.http.routers.monicaapp-secure.service"
        value = "${var.container_hostname_app}"
  }

  labels {
        label = "traefik.http.services.monicaapp.loadbalancer.server.port"
        value = "${var.container_port}"
  }

  labels {
        label = "traefik.http.routers.monicaapp-secure.middlewares"
        value = "authelia@docker"
  }

  labels {
        label = "traefik.docker.network"
        value = "frontend-net"
  }

}

