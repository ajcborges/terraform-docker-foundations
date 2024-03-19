# Repository Configuration

variable "name" {
  type = string
}

variable "username" {
  type = string
}

variable "description" {
  type    = string
  default = ""
}

variable "default_branch" {
  type    = string
  default = null
}

variable "protect" {
  type    = list(string)
  default = ["main"]
}

variable "homepage_url" {
  type    = string
  default = ""
}

variable "archived" {
  type    = bool
  default = false
}

variable "topics" {
  type    = set(string)
  default = []
}

variable "private" {
  type    = bool
  default = false
}

variable "has_issues" {
  type    = bool
  default = true
}

variable "has_projects" {
  type    = bool
  default = false
}

variable "has_wiki" {
  type    = bool
  default = false
}

variable "allow_merge_commit" {
  type    = bool
  default = false
}
variable "allow_squash_merge" {
  type    = bool
  default = true
}
variable "allow_rebase_merge" {
  type    = bool
  default = false
}

variable "gitignore_template" {
  type    = string
  default = ""
}

variable "license_template" {
  type    = string
  default = ""
}

variable "template" {
  type    = string
  default = "gcp-platform-foundations/repository-template"
}

variable "labels" {
  type    = list(object({ name = string, color = string }))
  default = []
}

# Master Branch Protection Configuration

variable "required_status_checks" {
  type    = set(string)
  default = []
}

variable "required_approving_review_count" {
  type    = number
  default = 1
}

# Gitsync configuration

variable "gitsync_webhook_urls" {
  type    = set(string)
  default = []
}

# Write access configuration

variable "read_access" {
  type    = set(object({ name = string, id = string, object_id = string, slug = string }))
  default = []
}

variable "write_access" {
  type    = set(object({ name = string, id = string, object_id = string, slug = string }))
  default = []
}

variable "merge_access" {
  type    = set(object({ name = string, id = string, object_id = string, slug = string }))
  default = []
}

variable "service_accounts" {
  type    = set(string)
  default = []
}