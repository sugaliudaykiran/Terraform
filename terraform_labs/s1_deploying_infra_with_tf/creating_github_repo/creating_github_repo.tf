# Required Additional details
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
    token = "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"
}

# Configure the resource
resource "github_repository" "Terra" {
    name = "Terraform"
    description = "Terraform lab work"

    private = false
}