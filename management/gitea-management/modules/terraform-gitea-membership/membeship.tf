# Validate existence of admins
# If the user have a Gitea account, Terraform will fail during planning


resource "gitea_user" "org_admins" {
  for_each = var.admins
  username = each.key
  login_name = each.key
  password ="ThisPasswordWillBeForceToChange"
  email = "${each.key}@cedeno.me"
  admin     = true
  force_password_change = true
  visibility = "limited"
}

locals {
  members = setunion(flatten(var.members))
  restricted = setunion(flatten(var.restricted))
}

# Validate existence of members
# If the user does not have a GHE account, Terraform will fail during planning

resource "gitea_user" "org_members" {
  for_each = toset([ for key in local.members : key if !contains(var.admins, key) ])
  username = each.key
  login_name = each.key
  password ="ThisPasswordWillBeForceToChange"
  email = "${each.key}@cedeno.me"
  visibility = "public"
  force_password_change = true
  admin     = false
}

resource "gitea_user" "org_restricted_members" {
  for_each = toset([ for key in local.restricted : key if contains(var.restricted, key) ])
  username = each.key
  login_name = each.key
  password ="ThisPasswordWillBeForceToChange"
  email = "${each.key}@cedeno.me"
  visibility = "public"
  force_password_change = true
  admin     = false
  restricted = true
}