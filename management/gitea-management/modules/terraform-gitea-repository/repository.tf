resource "gitea_repository" "repository" {
  username       = var.username
  name           = var.name
  description    = var.description
  default_branch = var.default_branch
  website        = var.homepage_url
  #topics             = var.topics
  archived           = var.archived
  private            = var.private
  has_issues         = var.has_issues
  has_projects       = var.has_projects
  has_wiki           = var.has_wiki
  allow_merge_commits = var.allow_merge_commit
  allow_squash_merge = var.allow_squash_merge
  allow_rebase       = var.allow_rebase_merge
  #gitignore_template = var.gitignore_template
  license = var.license_template

}








