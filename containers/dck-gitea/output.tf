/******************************************
This output is necessary for the outer blocks
output.tf to work.
 *****************************************/

output "app-ipadd" {
  value = "${docker_container.dck-gitea.ip_address}"
}

output "app-name" {
  value = "${docker_container.dck-gitea.name}"
}
