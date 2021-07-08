provider "docker" {
}

resource "docker_container" "dckr-nmp-db" {
  name                  = "dckr-nmp-db"
  image                 = docker_image.nmp-db-img.name
  restart               = "always"
  domainname            = var.container_domainname
  hostname              = var.container_hostname
  env = [ 
    "TZ=${var.TIME_ZONE}",
    "DB_MYSQL_HOST=${var.db_mysql[0]}", 
    "DB_MYSQL_PORT=${var.db_mysql[1]}",
    "DB_MYSQL_NAME=${var.db_mysql[2]}",
    "DB_MYSQL_USER=${var.db_user}",
    "DB_MYSQL_PASSWORD=${var.db_pass}"
    ]

  volumes {
  	volume_name    		  = "${docker_volume.nmp-db-vol.name}"
  	container_path 		  = "/var/lib/mysql"
  }
  
  networks_advanced {
    name		= "backend-net"
  }
}
