provider "docker" {
}

resource "docker_container" "dckr-nmp-db" {
  name                  = "dckr-nmp-db"
  image                 = docker_image.nmp-db-img.name
  restart               = "always"
  domainname            = var.container_domainname
  hostname              = var.container_hostname
  env                   = [ 
    "TZ=${var.TIME_ZONE}", 
    "DB_MYSQL_HOST=var.db_mysql_host",
    "DB_MYSQL_PORT=var.db_mysql_port",
    "DB_MYSQL_USER=var.db_mysql_user",
    "DB_MYSQL_PASSWORD=var.db_mysql_password",
    "DB_MYSQL_NAME=var.db_mysql_name"
    ]

  volumes {
  	volume_name    		  = "${docker_volume.nmp-db-vol.name}"
  	container_path 		        = "/var/lib/mysql"
  }
  
  networks_advanced {
    name		= "backend-net"
  }
}
