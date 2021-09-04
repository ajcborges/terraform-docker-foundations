resource "docker_container" "dck-heimdall" {
  name       = "dck-heimdall"
  image      = docker_image.heimdall-img.name
  restart    = "unless-stopped"
  shm_size   = 2000
  domainname = var.container_domainname
  hostname   = var.container_hostname
  env        = ["TZ=${var.TIME_ZONE}", "PUID=${var.container_puid}", "PGUID=${var.container_pgid}"]

  networks_advanced { 
    name = "frontend-net"
  }

  volumes {
    volume_name    = "${docker_volume.heimdall-cfg-vol.name}"
    container_path = "/config"
  }

  volumes {
    container_path = "/var/run/docker.sock"
    host_path      = "/var/run/docke.sock"
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
    label = "traefik.http.routers.heimdall.entrypoints"
    value = "http"
  }

  labels {
    label = "traefik.http.routers.heimdall.rule"
    value = "Host(`${var.traefik_dns_label}`)"
  }

  labels {
    label = "traefik.http.middlewares.heimdall-https-redirect.redirectscheme.scheme"
    value = "https"
  }

  labels {
    label = "traefik.http.routers.heimdall.middlewares"
    value = "heimdall-https-redirect"
  }

  labels {
    label = "traefik.http.routers.heimdall-secure.entrypoints"
    value = "https"
  }

  labels {
    label = "traefik.http.routers.heimdall-secure.rule"
    value = "Host(`${var.traefik_dns_label}`)"
  }

  labels {
    label = "traefik.http.routers.heimdall-secure.tls"
    value = "true"
  }

  labels {
    label = "traefik.http.routers.heimdall-secure.service"
    value = "${var.container_hostname}"
  }

  labels {
    label = "traefik.http.services.heimdall.loadbalancer.server.port"
    value = "${var.container_port}"
  }

  labels {
    label = "traefik.http.routers.heimdall-secure.middlewares"
    value = "authelia@docker"
  }

  labels {
    label = "traefik.docker.network"
    value = "frontend-net"
  }

}

