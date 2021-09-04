resource "docker_container" "dck-portainer" {
  name       = "dck-portainer"
  image      = docker_image.portainer-img.name
  restart    = "unless-stopped"
  domainname = var.container_domainname
  hostname   = var.container_hostname
  env        = ["TZ=${var.TIME_ZONE}", "ENV=${var.ENV}"]
  #security_opts         = ["no-new-privileges=true"]

  networks_advanced {
    name = "frontend-net"
  }

  volumes {
    container_path = "/var/run/docker.sock"
    host_path      = "/var/run/docker.sock"
    read_only      = true
  }

  volumes {
    container_path = "/etc/localtime"
    host_path      = "/etc/localtime"
    read_only      = true
  }

  volumes {
    volume_name    = "${docker_volume.portainer-vol.name}"
    container_path = var.container_path
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
    label = "traefik.http.routers.portainer.entrypoints"
    value = "http"
  }


  labels {
    label = "traefik.http.routers.portainer.rule"
    value = "Host(`${var.traefik_dns_label}`)"
  }

  labels {
    label = "traefik.http.middlewares.portainer-https-redirect.redirectscheme.scheme"
    value = "https"
  }

  labels {
    label = "traefik.http.routers.portainer.middlewares"
    value = "portainer-https-redirect"
  }

  labels {
    label = "traefik.http.routers.portainer-secure.entrypoints"
    value = "https"
  }

  labels {
    label = "traefik.http.routers.portainer-secure.rule"
    value = "Host(`${var.traefik_dns_label}`)"
  }

  labels {
    label = "traefik.http.routers.portainer-secure.tls"
    value = "true"
  }

  labels {
    label = "traefik.http.routers.portainer-secure.service"
    value = "${var.container_hostname}"
  }

  labels {
    label = "traefik.http.services.portainer.loadbalancer.server.port"
    value = "${var.container_port}"
  }

  labels {
    label = "traefik.http.routers.portainer-secure.middlewares"
    value = "authelia@docker"
  }

  labels {
    label = "traefik.docker.network"
    value = "frontend-net"
  }

  networks_advanced {
    name = "frontend-net"
  }
}