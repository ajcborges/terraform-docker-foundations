# This configures GHE organisation membership for the terraform-gcp-foundations Github Enterprise organisation.

module "members" {
  source = "./modules/terraform-gitea-membership"
  admins = [
    #Users
    ## require admin for:
    ## - break-glass scenarios
    ## - enabling Gitea Pages
    ## - installing OAuth / Gitea Aps

    # Admins - management of the orgs ongoing
    "ajcborges",


    # Service Accounts
    ## droneio requires admin for:
    ## - text here
    ## - text here
    ## - text here
    ## - text here
    "droneio",
  ]
  members = [

  ]

  restricted = [
    "roger",
  ]
}