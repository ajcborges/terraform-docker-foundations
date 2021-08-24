resource "docker_container" "dck-dupeguru" {
  name                  = "dck-dupeguru"
  image                 = docker_image.dupeguru-img.name
  restart               = "unless-stopped"
  domainname            = var.container_domainname
  hostname              = var.container_hostname
  env                   = [ "TZ=${var.TIME_ZONE}" ]

  networks_advanced {
    name		= "frontend-net"
  }

  volumes {
  	volume_name = "${docker_volume.dupeguru-cfg-vol.name}"
  	container_path = "/config"
  }

  volumes {
  	volume_name = "${docker_volume.dupeguru-dat-vol.name}"
  	container_path = "/storage"
  }

  volumes {
  	volume_name = "${docker_volume.dupeguru-bin-vol.name}"
  	container_path = "/trash"
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
        label = "traefik.http.routers.dupeguru.entrypoints"
        value = "http"
  } 

  labels {
        label = "traefik.http.routers.dupeguru.rule"
        value = "Host(`${var.traefik_dns_label}`)"
  }

  labels {
        label = "traefik.http.middlewares.dupeguru-https-redirect.redirectscheme.scheme"
        value = "https"
  }

  labels {
        label = "traefik.http.routers.dupeguru.middlewares"
        value = "dupeguru-https-redirect"
  }
  
  labels {
        label = "traefik.http.routers.dupeguru-secure.entrypoints"
        value = "https"
  }

  labels {
        label = "traefik.http.routers.dupeguru-secure.rule"
        value = "Host(`${var.traefik_dns_label}`)"
  }

  labels {
        label = "traefik.http.routers.dupeguru-secure.tls"
        value = "true"
  }

  labels {
        label = "traefik.http.routers.dupeguru-secure.service"
        value = "${var.container_hostname}"
  }

  labels {
        label = "traefik.http.services.dupeguru.loadbalancer.server.port"
        value = "${var.container_port}"
  }

  labels {
        label = "traefik.http.routers.dupeguru-secure.middlewares"
        value = "authelia@docker"
  }

  labels {
        label = "traefik.docker.network"
        value = "frontend-net"
  }

}

