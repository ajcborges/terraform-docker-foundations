# Copyright (C) 2018-2019 Nicolas Lamirault <nicolas.lamirault@gmail.com>

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

terraform {
  required_providers {
    gitea = {
      source  = "Lerentis/gitea"
      version = "0.5.0"
    }
  }
}

provider "gitea" {
  base_url = var.gitea_url   # optionally use GITEA_BASE_URL env var
  token    = var.gitea_token # optionally use GITEA_TOKEN env var

  # Username/Password authentication is mutally exclusive with token authentication
  # username = var.username # optionally use GITEA_USERNAME env var
  # password = var.password # optionally use GITEA_PASSWORD env var

  # A file containing the ca certificate to use in case ssl certificate is not from a standard chain
  #cacert_file = var.cacert_file 

  # If you are running a gitea instance with self signed TLS certificates
  # and you want to disable certificate validation you can deactivate it with this flag
  insecure = true
}