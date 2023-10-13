terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.16.0"
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
}
