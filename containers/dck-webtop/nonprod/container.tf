resource "docker_container" "dck-webtop" {
  name       = "dck-webtop"
  image      = docker_image.webtop-img.name
  restart    = "unless-stopped"
  shm_size   = 2000
  domainname = var.container_domainname
  hostname   = var.container_hostname
  env        = ["TZ=${var.TIME_ZONE}", "PUID=${var.container_puid}", "PGUID=${var.container_pgid}", "FILE__PASSWORD=/home/ajcborges/Documents/terraform-docker-foundation/containers/dck-webtop/mysecretpassword"]

  networks_advanced {
    name = "frontend-net"
  }

  networks_advanced {
    name = "backend-net"
  }

  volumes {
    volume_name    = "${docker_volume.webtop-cfg-vol.name}"
    container_path = "/config"
  }

  volumes {
    volume_name    = "${docker_volume.webtop-cfg-vol.name}"
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
    label = "traefik.http.routers.webtop.entrypoints"
    value = "http"
  }

  labels {
    label = "traefik.http.routers.webtop.rule"
    value = "Host(`${var.traefik_dns_label}`)"
  }

  labels {
    label = "traefik.http.middlewares.webtop-https-redirect.redirectscheme.scheme"
    value = "https"
  }

  labels {
    label = "traefik.http.routers.webtop.middlewares"
    value = "webtop-https-redirect"
  }

  labels {
    label = "traefik.http.routers.webtop-secure.entrypoints"
    value = "https"
  }

  labels {
    label = "traefik.http.routers.webtop-secure.rule"
    value = "Host(`${var.traefik_dns_label}`)"
  }

  labels {
    label = "traefik.http.routers.webtop-secure.tls"
    value = "true"
  }

  labels {
    label = "traefik.http.routers.webtop-secure.service"
    value = "${var.container_hostname}"
  }

  labels {
    label = "traefik.http.services.webtop.loadbalancer.server.port"
    value = "${var.container_port}"
  }

  labels {
    label = "traefik.http.routers.webtop-secure.middlewares"
    value = "authelia@docker"
  }

  labels {
    label = "traefik.docker.network"
    value = "frontend-net"
  }

}

