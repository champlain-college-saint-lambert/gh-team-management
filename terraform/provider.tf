terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
  required_version = ">= 1.0.5"

  backend "remote" {
    organization = "champlain-college-saint-lambert"
    workspaces {
      name = "gh_actions"
    }
  }

}

provider "github" {
  owner = var.github_org
  token = var.github_token
}

variable "github_token" {
  type      = string
  sensitive = true
}

variable "github_org" {
  type    = string
  default = "champlain-college-saint-lambert" 
}