terraform {
  required_providers {
    github = {
      source = "integrations/github"
      version = "5.18.0"
    }
  }
}

# Configure the Github provider
provider "github" {
    token = ""
}

resource "github_repository" "Terra" {
    name = "Terraform"
    description = "Terraform lab work"

    private = false
}
