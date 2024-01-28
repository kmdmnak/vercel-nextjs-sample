terraform {
  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = "~> 0.51.1"
    }
  }
}

provider "tfe" {
  token = var.terraform_cloud_token
}
