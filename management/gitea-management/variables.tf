## gitea_token need to be set as TF_VAR_gitea_token
## export TF_VAR_gitea_token=<token here>

variable "gitea_token" {
  description = " Gitea Token"
}


## gitea_token need to be set as TF_VAR_gitea_url
## export TF_VAR_gitea_url=<url here>
variable "gitea_url" {
  description = " Gitea TURL"
}

