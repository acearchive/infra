terraform {
  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
      version = "~> 3.0"
    }
  }

  cloud {
    organization = "acearchive"

    workspaces {
      name = "access"
    }
  }
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
  account_id = var.cloudflare_account_id
}
