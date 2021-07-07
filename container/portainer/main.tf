provider "docker" {
}

module "network" {
  source                = "../../modules/common/network/"
}

resource "docker_container" "dckr-portainer" {
  name                  = "dckr-portainer"
  image                 = docker_image.portainer-img.name
  restart               = "always"
  domainname            = var.container_domainname
  hostname              = var.container_hostname
  env                   = [ "TZ=${var.TIME_ZONE}" ]
  ports {
    internal            = 9000
    external            = var.http_port
  }
  volumes {
 	  container_path		  = "/var/run/docker.sock"
 	  host_path		        = "/var/run/docker.sock"	
  }
  volumes {
  	volume_name    		  = "${docker_volume.portainer-vol.name}"
  	container_path 		  = var.container_path
  }
  networks_advanced {
    name		= "frontend-net"
  }
}
