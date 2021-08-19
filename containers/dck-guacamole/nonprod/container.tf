resource "docker_container" "dck-guacamole" {
  name                  = "dck-guacamole"
  image                 = docker_image.guacamole-img.name
  restart               = "unless-stopped"
  domainname            = var.container_domainname
  hostname              = var.container_hostname
  env                   = [ "TZ=${var.TIME_ZONE}" ]

  networks_advanced {
    name		= "frontend-net"
  }

  volumes {
  	volume_name = "${docker_volume.guacamole-cfg-vol.name}"
  	container_path = "/config"
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
        label = "traefik.http.routers.guacamole.entrypoints"
        value = "http"
  } 

  labels {
        label = "traefik.http.routers.guacamole.rule"
        value = "Host(`${var.traefik_dns_label}`)"
  }

  labels {
        label = "traefik.http.middlewares.guacamole-https-redirect.redirectscheme.scheme"
        value = "https"
  }

  labels {
        label = "traefik.http.routers.guacamole.middlewares"
        value = "guacamole-https-redirect"
  }
  
  labels {
        label = "traefik.http.routers.guacamole-secure.entrypoints"
        value = "https"
  }

  labels {
        label = "traefik.http.routers.guacamole-secure.rule"
        value = "Host(`${var.traefik_dns_label}`)"
  }

  labels {
        label = "traefik.http.routers.guacamole-secure.tls"
        value = "true"
  }

  labels {
        label = "traefik.http.routers.guacamole-secure.service"
        value = "${var.container_hostname}"
  }

  labels {
        label = "traefik.http.services.guacamole.loadbalancer.server.port"
        value = "${var.container_port}"
  }

  labels {
        label = "traefik.http.routers.guacamole-secure.middlewares"
        value = "authelia@docker"
  }

  labels {
        label = "traefik.docker.network"
        value = "frontend-net"
  }

}

