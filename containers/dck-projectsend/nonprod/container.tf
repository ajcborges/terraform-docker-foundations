# Referred to https://github.com/linuxserver/docker-bookstack
# for config.
resource "docker_container" "dck-projectsendapp" {
    name                    = "dck-projectsendapp"
    image                   = docker_image.projectsend-img.latest
    restart                 = "unless-stopped"
    domainname              = var.container_domainname
    hostname                = var.container_hostname_app
    destroy_grace_seconds   = 30
    must_run                = true


    env = [
        "TZ=${var.TIME_ZONE}",
        "MYSQL_HOST=projectsenddb",
        "MYSQL_USER=projectsend",
        "MYSQL_PASSWORD=${var.projectsend_mariadb_password}",
        "MYSQL_DATABASE=projectsendapp",
        "PUID=${var.container_puid}",
        "PGUID=${var.container_pgid}"
    ]

    networks_advanced {
        name                = "frontend-net"
    }

    networks_advanced {
        name                = "backend-net"
    }

    volumes { 
        volume_name         = "${docker_volume.projectsendapp-cfg-vol.name}"
        container_path      = "/config"
    }

     volumes { 
        volume_name         = "${docker_volume.projectsendapp-dat-vol.name}"
        container_path      = "/data"
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
        label = "traefik.http.routers.projectsendapp.entrypoints"
        value = "http"
  } 

  labels {
        label = "traefik.http.routers.projectsendapp.rule"
        value = "Host(`${var.traefik_dns_label}`)"
  }

  labels {
        label = "traefik.http.middlewares.projectsendapp-https-redirect.redirectscheme.scheme"
        value = "https"
  }

  labels {
        label = "traefik.http.routers.projectsendapp.middlewares"
        value = "projectsendapp-https-redirect"
  }
  
  labels {
        label = "traefik.http.routers.projectsendapp-secure.entrypoints"
        value = "https"
  }

  labels {
        label = "traefik.http.routers.projectsendapp-secure.rule"
        value = "Host(`${var.traefik_dns_label}`)"
  }

  labels {
        label = "traefik.http.routers.projectsendapp-secure.tls"
        value = "true"
  }

  labels {
        label = "traefik.http.routers.projectsendapp-secure.service"
        value = "${var.container_hostname_app}"
  }

  labels {
        label = "traefik.http.services.projectsendapp.loadbalancer.server.port"
        value = "${var.container_port}"
  }

  labels {
        label = "traefik.http.routers.projectsendapp-secure.middlewares"
        value = "authelia@docker"
  }

  labels {
        label = "traefik.docker.network"
        value = "frontend-net"
  }

}

