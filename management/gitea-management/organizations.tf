module "selfhosted-org" {
  source      = "./modules/terraform-gitea-organisation"
  name        = "selfhosted"
  description = "SelfHosted Projects Org."

}