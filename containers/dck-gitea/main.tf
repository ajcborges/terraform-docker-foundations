

# Start a Container
resource "docker_container" "dck-gitea" {
  name                  = var.app_name                #The name of the container
  image                 = docker_image.gitea-img.name # The ID of the image to back this container
  restart               = "unless-stopped"            # The restart policy for the container.
  domainname            = var.app_domain              # Domain name of the container.
  hostname              = var.app_hostname            # Hostname of the container.
  memory                = 512                         # Memory limit for the container in MBs.
  destroy_grace_seconds = 10                          # Container will be destroyed after 10 seconds or on successful stop.
  must_run              = true                        # If true, then the Docker container will be kept running.

  # Environment variables to set in the form of KEY=VALUE
  env = [
    "USER_UID=1000",
    "USER_GID=1000",

    # Site information
    "APP_NAME=Gitea", # Application name, used in the page title.
    "RUN_MODE=prod",
    "DOMAIN=${var.app_server_ipaddress}",
    "SSH_DOMAIN=${var.app_server_ipaddress}",
    "HTTP_PORT=${var.app_internal_port_one}",
    "ROOT_URL=http://${var.app_server_ipaddress}:${var.app_internal_port_one}",
    "SSH_PORT=${var.app_external_port_two}",
    "SSH_LISTEN_PORT=${var.app_internal_port_two}",
    "DB_TYPE=${var.db_type}"
  ]

  # Publish a container's port(s) to the host.
  ports {
    internal = var.app_internal_port_one # Port within the container.
    external = var.app_external_port_one # Port exposed out of the container.
  }

  # Publish a container's port(s) to the host.
  ports {
    internal = var.app_internal_port_two # Port within the container.
    external = var.app_external_port_two # Port exposed out of the container.
  }

  # The networks the container is attached to.
  networks_advanced {
    name = var.app_network_one # The name of the frontend network.
  }

  # Spec for mounting volumes in the container. 
  volumes {
    container_path = "/var/run/docker.sock" # The path in the container where the volume will be mounted.
    host_path      = "/var/run/docker.sock" # The path on the host where the volume is coming from.
    read_only      = true                   # If true, this volume will be readonly. Defaults to false.
  }

  # Spec for mounting volumes in the container. 
  volumes {
    container_path = "/etc/timezone" # The path in the container where the volume will be mounted.
    host_path      = "/etc/timezone" # The path on the host where the volume is coming from.
    read_only      = true            # If true, this volume will be readonly. Defaults to false.
  }

  # Spec for mounting volumes in the container. 
  volumes {
    container_path = "/etc/localtime" # The path in the container where the volume will be mounted.
    host_path      = "/etc/localtime" # The path on the host where the volume is coming from.
    read_only      = true             # If true, this volume will be readonly. Defaults to false.
  }

  # Spec for mounting volumes in the container. 
  volumes {
    volume_name    = docker_volume.gitea-vol.name # The name of the docker volume which should be mounted.
    container_path = "/data"                      # The path in the container where the volume will be mounted.
  }

}
