# Foundations repositories belong here

module "tf_portainer" {
  source      = "./modules/terraform-gitea-repository"
#  depends_on = [
#    "modules.gitea_org.organisation"
#  ]

  name        = "portainer"
  username    = "selfhosted"
  description = "Management GUI for Kubernetes, Docker and Swarm."

  topics = [
    "docker",
    "foundations",
    "selfhosted",
    "platform",
  ]

}

module "tf_gitea" {
  source      = "./modules/terraform-gitea-repository"
#  depends_on = [
#    "modules.gitea_org.organisation" 
#    ]

  name        = "gitea"
  username    = "selfhosted"
  description = "Management GUI for Kubernetes, Docker and Swarm."

  topics = [
    "docker",
    "foundations",
    "selfhosted",
    "platform",
  ]

}

module "tf_gitea_management" {
  source      = "./modules/terraform-gitea-repository"
#  depends_on = [
#    "modules.gitea_org.organisation"
#  ]

  name        = "gitea-management"
  username    = "selfhosted"
  description = "Management configuration for Gitea."

  topics = [
    "docker",
    "foundations",
    "selfhosted",
    "platform",
  ]

}
